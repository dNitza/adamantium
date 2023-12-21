# frozen_string_literal: true

RSpec.describe Adamantium::WebmentionRequestParser do
  include Dry::Monads[:result]
  subject { described_class.new }

  let(:reply_json) {
    '{
      "type": "entry",
      "author": {
        "type": "card",
        "name": "nitza",
        "photo": "",
        "url": "https://micro.blog/nitza"
      },
      "url": "https://micro.blog/nitza/20554783",
      "published": "2023-07-05T09:44:41+00:00",
      "wm-received": "2023-07-05T09:44:48Z",
      "wm-id": 1692950,
      "wm-source": "https://micro.blog/nitza/20554783",
      "wm-target": "https://dnitza.com/post/e413397a-9912-4914-a0d1-3d1c324e014b",
      "content": {
        "html": "<p><a href=\"https://micro.blog/example\">@example</a> hah! I thought the same thing — but this is the most affordable thing that Teenage Engineering makes 😅</p>",
        "text": "@example hah! I thought the same thing — but this is the most affordable thing that Teenage Engineering makes 😅"
      },
      "in-reply-to": "https://dnitza.com/post/e413397a-9912-4914-a0d1-3d1c324e014b",
      "wm-property": "in-reply-to",
      "wm-private": false
    }'
  }

  let(:webmention_io_json) {
    '{
        "post": {
          "type":"entry",
          "author": {
              "type":"card",
              "name":"nitza",
              "photo":"https://webmention.io/avatar/micro.blog/2aa75068b73fe7777faf37c7933486a6acd5d158fcdf769064c0472ecd55f120.jpg",
              "url":"https://micro.blog/nitza"
          },
          "url":"https://micro.blog/nitza/28127218",
          "published":"2023-12-20T22:28:40+00:00",
          "wm-received":"2023-12-20T22:28:42Z",
          "wm-id":1756646,
          "wm-source":"https://micro.blog/nitza/28127218",
          "wm-target":"https://dnitza.com/post/b9d5bfca-4f51-463c-a63c-7b2e1b8a5ad9",
          "wm-protocol":"webmention",
          "content":{
              "html": "<p><a href=\"https://micro.blog/example\">@example</a> hah! I thought the same thing — but this is the most affordable thing that Teenage Engineering makes 😅</p>",
              "text": "@example hah! I thought the same thing — but this is the most affordable thing that Teenage Engineering makes 😅"
          },
          "in-reply-to":"https://dnitza.com/post/b9d5bfca-4f51-463c-a63c-7b2e1b8a5ad9",
          "wm-property":"in-reply-to",
          "wm-private":false
      }
    }'
  }

  context "reply" do
    it "parses a reply" do
      expect(subject.call(params: JSON.parse(reply_json, symbolize_names: true))).to be_success
      expect(subject.call(params: JSON.parse(webmention_io_json, symbolize_names: true))).to be_success
    end

    it "fails to parses a reply" do
      expect(subject.call(params: JSON.parse("{ }", symbolize_names: true))).to be_failure
    end
  end
end
