require "spec_helper"

RSpec.describe Adamantium::Syndication::Mastodon do
  subject { described_class.new }

  describe "syndication to mastodon" do
    let(:post) {
      Adamantium::Entities::PostRequest.new(
        h: "h-type",
        action: nil,
        name: "My Post",
        content: "Content",
        slug: "my-post",
        category: ["ruby", "rspec"],
        published_at: Time.now,
        post_type: "post"
      )
    }

    it "syndicates when it has a post" do
      response = subject.call(post: post)
      expect(response).to be_success
    end
  end
end
