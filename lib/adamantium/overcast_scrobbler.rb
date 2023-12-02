require "httparty"
require "nokogiri"
require "down"

module Adamantium
  class OvercastScrobbler
    def initialize(username:, password:)
      @username = username
      @password = password
    end

    def call
      repo = Adamantium::Container["repos.podcast_scrobble_repo"]
      response = HTTParty.post("https://overcast.fm/login", body: {email: @username, password: @password})
      cookie = response.request.options[:headers]["Cookie"]

      opml_file = Down::NetHttp.download("https://overcast.fm/account/export_opml/extended", headers: {"Cookie" => cookie})
      doc = File.open(opml_file) { |f| Nokogiri::XML(f) }

      podcast_list = []

      doc.xpath("//outline[@type='rss']").each_with_object(podcast_list) do |rss, memo|
        podcasts = rss.xpath("outline[@type='podcast-episode']").select { |ep| ep.get_attribute("played") == "1" }

        name = rss.get_attribute("title")

        podcasts.each do |episode|
          attrs = {}
          attrs[:overcast_id] = episode.get_attribute("overcastId")
          attrs[:podcast_name] = name
          attrs[:title] = episode.get_attribute("title")
          attrs[:url] = episode.get_attribute("url")
          attrs[:enclosure_url] = episode.get_attribute("enclosureUrl")
          attrs[:listened_at] = episode.get_attribute("userUpdatedDate")

          memo << attrs
        end

        podcast_list.each do |podcast|
          next if repo.exists?(id: podcast[:overcast_id])
          repo.create(podcast)
        end
      end
    end
  end
end
