require "spec_helper"
require "dry/monads"

RSpec.describe Adamantium::Commands::Posts::Syndicate do
  include Dry::Monads[:result]

  let(:settings) { double("settings", mastodon_server: "https://mastodon.example/@tester") }
  let(:mastodon_client) { double("Adamantium::Client::Mastodon") }
  let(:mastodon_syndicator) { Adamantium::Syndication::Mastodon.new(mastodon_client: mastodon_client) }
  let(:pinboard_syndicator) { Adamantium::Syndication::Pinboard.new(api_key: "") }
  let(:post) { {url: "example.com", syndicate_to: ["https://mastodon.example", "https://pinboard.in"]} }

  subject { described_class.new(mastodon: mastodon_syndicator, pinboard: pinboard_syndicator, settings: settings) }

  before do
    allow(mastodon_client).to receive(:create_post).with(post: post, media_ids: nil).and_return(Success("http://mastodon.example/post/123"))
    allow(pinboard_syndicator).to receive(:call).with(post: post).and_return(Success("http://pinboard.in/permalink"))
  end

  it "syndicates a post to Mastodon" do
    result = subject.call(post)

    expect(result).to be_success
    expect(result.value!).to eq [
      [:mastodon, "http://mastodon.example/post/123"],
      [:pinboard, "http://pinboard.in/permalink"]
    ]
  end
end
