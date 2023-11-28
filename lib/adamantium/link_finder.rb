require "uri"

module Adamantium
  class LinkFinder
    IGNORE_LIST = %w[twitter.com
      instagram.com
      google.com
      overcast.fm
      youtube.com
      bsky.app
      github.com]

    def call(content)
      links = URI::DEFAULT_PARSER.extract(content)

      links.reject do |link|
        link.end_with?(":") ||
          IGNORE_LIST.include?(URI.parse(link).host)
      end
    end
  end
end
