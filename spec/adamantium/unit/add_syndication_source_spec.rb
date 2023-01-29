require "spec_helper"

RSpec.describe Adamantium::Commands::Posts::AddSyndicationSource, :db do
  subject { described_class.new }

  describe "setting a syndication source" do
    let(:post) { Test::Factory[:post] }
    let(:repo) { Adamantium::Container["repos.post_repo"] }

    context "when no sources exist" do
      it "sets a new source" do
        subject.call(post.id, "mastodon", "some_url")

        updated_post = repo.find!(post.id)

        expect(updated_post.syndication_sources).to eq({
          "mastodon" => "some_url"
        })
      end
    end

    context "when a source exists" do
      let(:post) { Test::Factory[:post, syndication_sources: {"twitter" => "twitter_url"}, slug: "existing-post"] }

      it "adds another source" do
        subject.call(post.id, "mastodon", "some_url")

        updated_post = repo.find!(post.id)

        expect(updated_post.syndication_sources).to eq({
          "mastodon" => "some_url",
          "twitter" => "twitter_url"
        })
      end
    end
  end
end
