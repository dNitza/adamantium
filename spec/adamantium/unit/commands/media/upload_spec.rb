# frozen_string_literal: true

require "dry/monads"
require "base64"

RSpec.describe Adamantium::Commands::Media::Upload do
  subject { described_class.new }

  it "saves a file and returns its URL" do
    image = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg=="
    tempfile = Tempfile.new(["test", ".jpg"])
    tempfile.write Base64.decode64(image)
    tempfile.rewind
    file = {
      filename: "foo.jpg",
      tempfile: tempfile
    }

    result = subject.call(file: file)
    expected_path = /media\/#{Time.now.strftime("%m-%Y")}\/[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}.jpg/
    expect(result).to be_success
    expect(result.value!).to match expected_path
    File.read("public/#{result.value!.gsub("http://localhost/", "")}")
    File.delete("public/#{result.value!.gsub("http://localhost/", "")}")
    tempfile.close
    tempfile.unlink
  end

  it "returns a Failure if the file couldn't be saved" do
    file = {filename: "file.txt", tempfile: Tempfile.new}

    result = subject.call(file: file)
    expect(result).to be_failure
  end
end
