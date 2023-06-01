# frozen_string_literal: true
require "spec_helper"

RSpec.describe Adamantium::Geo::GpxParser do

  subject { described_class.new }

  let(:gpx_file) { File.join(SPEC_ROOT,  "support", "fixtures", "geo.gpx") }
  let(:expected_svg) { File.read(File.join(SPEC_ROOT,  "support", "fixtures", "geo.svg")) }

  it "parses a gpx file" do
    # puts gpx_file.inspect
    result = subject.call(path: gpx_file).value!

    parsed_svg = Nokogiri::XML::Document.parse(result[:svg])
    svg = Nokogiri::XML::Document.parse(expected_svg)
    expect(parsed_svg.xpath("//title")).to eq svg.xpath("//title")
    expect(result[:distance]).to eq 3.0724966849262554
    expect(result[:duration]).to eq 15237.0
  end
end