require "spec_helper"

RSpec.describe Adamantium::Commands::Posts::Undelete, :db do
  let(:post_repo) { spy(Adamantium::Repos::PostRepo) }
  let(:subject) { described_class.new(post_repo: post_repo) }

  it "deletes a post" do
    url = "http://example.com/posts/slug-here"
    subject.call(params: {url: url})

    expect(post_repo).to have_received(:restore!).with("slug-here")
  end
end
