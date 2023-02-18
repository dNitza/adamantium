require "spec_helper"

RSpec.describe Adamantium::Commands::Posts::Update, :db do
  # Adding: add a property that didn't previously exist
  # If there are any existing values for this property, they are not changed, the new values are added.
  # If the property does not exist already, it is created.
  # E.g. Adding tags or a syndication link after a post has been created

  subject { described_class.new }

  describe "add" do
    let(:post) { Test::Factory[:post] }
    let(:repo) { Adamantium::Container["repos.post_repo"] }

    let(:params) {
      {
        url: "http://example.com/posts/#{post.slug}",
        add: {
          name: ["New Name"],
          content: ["New Content"],
          syndication: ["http://example.com"]
        }
      }
    }

    it "only adds new properties" do
      subject.call(params: params)

      updated_post = repo.fetch!(post.slug)

      expect(updated_post.name).to eq(post.name)
      expect(updated_post.content).to eq(post.content)
      expect(updated_post.syndication_sources.values).to include "http://example.com"
    end
  end

  # Replacing: Replace all values of the property. If the property does not exist already, it is created.
  describe "replace" do
    let(:post) { Test::Factory[:post] }
    let(:repo) { Adamantium::Container["repos.post_repo"] }

    let(:params) {
      {
        url: "http://example.com/posts/#{post.slug}",
        replace: {
          content: ["New Content"]
        }
      }
    }

    it "replaces existing properties" do
      subject.call(params: params)

      updated_post = repo.fetch!(post.slug)

      expect(updated_post.name).to eq(post.name)
      expect(updated_post.content).to eq("<p>New Content</p>\n")
    end
  end

  # Remove: If the property exists, remove it. This completely removes the specified property.
  describe "remove" do
    let(:post1) { Test::Factory[:post] }
    let(:post2) { Test::Factory[:post] }
    let(:repo) { Adamantium::Container["repos.post_repo"] }

    let(:complete_params) {
      {
        url: "http://example.com/posts/#{post1.slug}",
        delete: ["category", "content"]
      }
    }

    let(:partial_params) {
      {
        url: "http://example.com/posts/#{post2.slug}",
        delete: {
          category: ["tests"]
        }
      }
    }

    it "deletes a whole property" do
      repo.tag_post(post_id: post1.id, tags: ["ruby", "tests"])

      subject.call(params: complete_params)

      updated_post = repo.fetch!(post1.slug)

      expect(updated_post.tags.map(&:label)).to eq([])
      expect(updated_post.content).to eq nil
    end

    it "deletes a partial property" do
      repo.tag_post(post_id: post2.id, tags: ["ruby", "tests"])

      subject.call(params: partial_params)

      updated_post = repo.fetch!(post2.slug)

      expect(updated_post.tags.map(&:label)).to eq ["ruby"]
    end
  end
end
