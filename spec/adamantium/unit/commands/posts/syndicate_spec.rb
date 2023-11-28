require "spec_helper"
require "dry/monads"

RSpec.describe Micropub::Commands::Posts::Syndicate do
  include Dry::Monads[:result]

  let(:settings) { double("settings", mastodon_server: "https://mastodon.example/@tester", blue_sky_url: "https://bluesky.app") }
  let(:mastodon_client) { double("Adamantium::Client::Mastodon") }
  let(:mastodon_syndicator) { Adamantium::Syndication::Mastodon.new(mastodon_client: mastodon_client) }
  let(:post) { {url: "example.com", syndicate_to: ["https://mastodon.example", "https://bsky.app"], category: []} }
  let(:add_post_syndication_source) { spy(Micropub::Commands::Posts::AddSyndicationSource) }

  subject {
    described_class.new(mastodon: mastodon_syndicator,
      settings: settings,
      add_post_syndication_source: add_post_syndication_source)
  }

  before do
    allow(mastodon_client).to receive(:create_post).with(post: post, media_ids: nil).and_return(Success("http://mastodon.example/post/123"))
  end

  it "syndicates a post to Mastodon" do
    result = subject.call(1, post)

    expect(result).to be_success
  end
end
