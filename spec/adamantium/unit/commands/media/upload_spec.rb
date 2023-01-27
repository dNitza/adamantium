# frozen_string_literal: true

require "dry/monads"

RSpec.describe Adamantium::Commands::Media::Upload do
  subject { described_class.new }

  it "saves a file and returns its URL" do
    file = {
      filename: "foo.txt",
      tempfile: Tempfile.new
    }

    result = subject.call(file: file)
    expected_path = "media/#{Time.now.strftime("%m-%Y")}/foo.txt"
    expect(result).to be_success
    expect(result.value!).to eq "http://localhost/#{expected_path}"
    File.read("public/#{expected_path}")
    File.delete("public/#{expected_path}")
  end

  it "returns a Failure if the file couldn't be saved" do
    file = {filename: "file.txt", tempfile: ""}

    result = subject.call(file: file)
    expect(result).to be_failure
  end
end
