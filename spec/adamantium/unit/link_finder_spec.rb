require "spec_helper"

RSpec.describe Adamantium::LinkFinder do
  subject { described_class.new }

  it "finds allowed links in a string" do
    text = "Check out some of these cool websites: https://google.com https://example.com or even http://twitter.com and https://pinboard.in!"

    expect(subject.call(text)).to eq ["https://example.com", "https://pinboard.in"]
  end
end
