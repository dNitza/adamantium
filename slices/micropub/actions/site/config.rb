module Micropub
  module Actions
    module Site
      class Config < Action
        include Deps["settings", "queries.posts.microformat_post"]
        before :authenticate!

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
                {type: "note", name: "Note", properties: %w[content photo category]},
                {type: "article", name: "Article", properties: %w[name content category]},
                {type: "photo", name: "Photo", properties: %w[name photo content category]},
                {type: "video", name: "Video", properties: %w[name video content category]},
                {type: "bookmark", name: "Bookmark", properties: %w[name content category]}
              ],
              "syndicate-to" => [
                {
                  uid: "https://social.dnitza.com",
                  name: "Mastodon"
                },
                {
                  uid: "https://bsky.social",
                  name: "Blue Sky"
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
                },
                {
                  uid: "https://bsky.social",
                  name: "Blue Sky"
                }
              ]
            }.to_json
          elsif req.params[:q] == "source"
            res.status = 200
            res.content_type = "Application/JSON"
            res.body = microformat_post.call(url: req.params[:url], filter: req.params[:filter], properties: req.params[:properties]).to_json
          else
            res.redirect_to "/"
          end
        end
      end
    end
  end
end
