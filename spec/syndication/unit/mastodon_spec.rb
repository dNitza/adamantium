require "spec_helper"
require "dry/monads"

RSpec.describe Adamantium::Syndication::Mastodon do
  include Dry::Monads[:result]

  let(:client) { double("mastodon client", create_post: Success(), upload_media: Success()) }
  subject { described_class.new(mastodon_client: client) }

  describe "syndication to mastodon" do
    let(:post) {
      Micropub::Entities::PostRequest.new(
        h: "h-type",
        action: nil,
        name: "My Post",
        content: "Content",
        slug: "my-post",
        category: ["ruby", "rspec"],
        published_at: Time.now,
        post_type: "post",
        syndicate_to: [],
        photos: [],
        location: nil,
        in_reply_to: nil,
        emoji: nil
      )
    }

    it "syndicates when it has a post" do
      response = subject.call(post: post)
      expect(response).to be_success
    end
  end
end
