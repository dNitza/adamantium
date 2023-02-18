# frozen_string_literal: true

RSpec.describe Adamantium::SlugCreator do
  describe "#call" do
    subject { described_class.new }
    let(:checker) { ->(_input) { false } }
    let(:uuid_regex) { /^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/ }

    it "creates a slugified string" do
      expect(subject.call(text: "my string", checker: checker)).to eq "my-string"
    end

    it "can handle no input" do
      expect(subject.call(text: nil, checker: checker)).to match(uuid_regex)
    end

    it "adds a number to the end of the slug if the checker finds an existing slug" do
      text = "my-existing-slug"
      checker = ->(input) { true if input == text }
      expect(subject.call(text: text, checker: checker)).to eq "my-existing-slug-1"
    end
  end
end
