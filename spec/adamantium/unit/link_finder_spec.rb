require "spec_helper"

RSpec.describe Adamantium::LinkFinder do
  subject { described_class.new }

  it "finds allowed links in a string" do
    text = "Check out some of these cool websites: https://google.com https://example.com or even http://twitter.com and https://bsky.app"

    expect(subject.call(text)).to eq [URI("https://example.com")]
  end
end
