module Adamantium
  module Actions
    module Site
      class Config < Action
        include Deps["settings", "views.site.home"]

        def handle(req, res)
          if req.params[:q] == "config"
            res.status = 200
            res.content_type = "Application/JSON"
            res.body = {
              "media-endpoint" => settings.micropub_media_endpoint,
              "destination" => [
                {uid: settings.micropub_site_id, name: settings.micropub_site_name}
              ],
              "post-types" => [
                {type: "note", name: "Note", properties: %w[content category]},
                {type: "article", name: "Article", properties: %w[name content category]},
                {type: "photo", name: "Photo", properties: %w[name content category]},
                {type: "bookmark", name: "Bookmark", properties: %w[name content category]}
              ],
              "syndicate-to" => [
                {
                  uid: "https://social.dnitza.com",
                  name: "Mastodon"
                }
              ]
            }.to_json
          elsif req.params[:q] == "syndicate-to"
            res.status = 200
            res.content_type = "Application/JSON"
            res.body = {
              "syndicate-to" => [
                {
                  uid: "https://social.dnitza.com",
                  name: "Mastodon"
                }
              ]
            }.to_json
          else
            res.render home
          end
        end
      end
    end
  end
end
