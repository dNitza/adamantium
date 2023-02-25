# frozen_string_literal: true

RSpec.describe "Post creation", :db, :requests do
  let(:post_repo) { Adamantium::Repos::PostRepo.new }

  context "posts" do
    it "is successful" do
      params = {
        type: ["h-entry"],
        properties: {
          category: ["ruby", "rspec"],
          name: ["Test"],
          content: [
            "<p>Hello world!</p>"
          ]
        }
      }

      post "/micropub", params

      expect(last_response).to be_successful
      expect(post_repo.post_listing.count).to eq 1
      expect(post_repo.post_listing.first.tags.map(&:label)).to eq ["ruby", "rspec"]
    end

    it "is successful" do
      params = {
        type: ["h-entry"],
        properties: {
          category: ["ruby", "rspec"],
          name: [],
          content: [
            "<p>Hello world!</p>"
          ]
        }
      }

      post "/micropub", params

      expect(last_response).to be_successful
      expect(post_repo.post_listing.count).to eq 1
      expect(post_repo.post_listing.first.tags.map(&:label)).to eq ["ruby", "rspec"]
    end
  end

  context "bookmarks" do
    it "is successful" do
      params = {
        h: "entry",
        "bookmark-of": "http://example.com",
        name: "Name",
        content: "Content of theh post"
      }

      post "/micropub", params

      expect(last_response).to be_successful
      expect(post_repo.bookmark_listing.count).to eq 1
    end
  end

  context "auth" do
    it "does not allow multiple auth methods" do
      params = {
        access_token: "foo"
      }

      headers = {
        HTTP_AUTHORIZATION: "Bearer foo",
        CONTENT_TYPE: "application/json"
      }

      post "/micropub", params.to_json, headers

      expect(last_response.status).to eq 400
    end
  end
end
