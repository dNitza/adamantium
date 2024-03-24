# frozen_string_literal: true

RSpec.describe "Webmention creation", :db, :requests do
  let(:post_repo) { Adamantium::Repos::PostRepo.new }
  let(:post_record) { Test::Factory[:post] }

  context "reply" do
    let(:reply_json) {
      {
        post: {
          type: "entry",
          author: {
            type: "card",
            name: "nitza",
            photo: "",
            url: "https://micro.blog/nitza"
          },
          url: "https://micro.blog/nitza/20554783",
          published: "2023-07-05T09:44:41+00:00",
          "wm-received": "2023-07-05T09:44:48Z",
          "wm-id": 1692950,
          "wm-source": "https://micro.blog/nitza/20554783",
          "wm-target": "https://dnitza.com/post/#{post_record.slug}",
          content: {
            html: "<p><a href=\"https://micro.blog/example\">@example</a> hah! I thought the same thing — but this is the most affordable thing that Teenage Engineering makes 😅</p>",
            text: "@example hah! I thought the same thing — but this is the most affordable thing that Teenage Engineering makes 😅"
          },
          "in-reply-to": "https://dnitza.com/post/#{post_record.slug}",
          "wm-property": "in-reply-to",
          "wm-private": false
        }
      }
    }

    it "is successful" do
      # params = JSON.parse(reply_json, symbolize_names: true)

      post "/micropub/webmentions", reply_json

      expect(last_response).to be_successful
    end
  end
end
