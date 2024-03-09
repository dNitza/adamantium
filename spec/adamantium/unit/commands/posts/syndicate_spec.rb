require "spec_helper"
require "dry/monads"

RSpec.describe Micropub::Commands::Posts::Syndicate do
  include Dry::Monads[:result]

  let(:settings) { double("settings", mastodon_server: "https://mastodon.example/@tester", blue_sky_url: "https://bluesky.app") }
  let(:mastodon_client) { double("Adamantium::Client::Mastodon") }
  let(:mastodon_syndicator) { Adamantium::Syndication::Mastodon.new(mastodon_client: mastodon_client) }
  let(:post) { {url: "example.com", content: "<p>Some cool post <img src='https://picsum.photos/200' /> <img src='https://picsum.photos/100' /></p>", syndicate_to: ["https://mastodon.example", "https://bsky.app"], category: []} }
  let(:add_post_syndication_source) { spy(Micropub::Commands::Posts::AddSyndicationSource) }

  subject {
    described_class.new(mastodon: mastodon_syndicator,
      settings: settings,
      add_post_syndication_source: add_post_syndication_source)
  }

  before do
    allow(mastodon_client).to receive(:upload_media).with(photo: {"alt" => "", "value" => "https://picsum.photos/100"}).and_return("123")
    allow(mastodon_client).to receive(:upload_media).with(photo: {"alt" => "", "value" => "https://picsum.photos/200"}).and_return("456")
    allow(mastodon_client).to receive(:create_post).with(post: post, media_ids: ["456", "123"]).and_return(Success("http://mastodon.example/post/123"))
  end

  it "syndicates a post to Mastodon" do
    result = subject.call(1, post)

    expect(result).to be_success
  end
end
