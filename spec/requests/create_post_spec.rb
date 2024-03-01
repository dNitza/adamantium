# frozen_string_literal: true

RSpec.describe "Post creation", :db, :requests do
  let(:post_repo) { Main::Repos::PostRepo.new }

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
      expect(post_repo.statuses_listing.count).to eq 1
      expect(post_repo.statuses_listing.first.tags.map(&:label)).to eq ["ruby", "rspec"]
    end

    it "Create an h-entry with HTML content (JSON)" do
      params = {
        type: ["h-entry"],
        properties: {
          content: [{
                        html: "<p>This post has <b>bold</b> and <i>italic</i> text.</p>"
                      }]
        }
      }

      post "/micropub", params

      expect(last_response).to be_successful
      expect(post_repo.statuses_listing.count).to eq 1
      expect(post_repo.statuses_listing.first.content).to eq "<p>This post has <b>bold</b> and <i>italic</i> text.</p>\n"
    end

    it "Create an h-entry with a photo referenced by URL (JSON)" do
      params = {
        type: ["h-entry"],
        properties: {
          content: ["Micropub test of creating a photo referenced by URL. This post should include a photo of a sunset."],
          photo: ["https://micropub.rocks/media/sunset.jpg"]
        }
      }

      post "/micropub", params

      expect(last_response).to be_successful
      expect(post_repo.statuses_listing.count).to eq 1
      expect(post_repo.statuses_listing.first.photos.count).to eq 1
      expect(post_repo.statuses_listing.first.content).to eq "<p>Micropub test of creating a photo referenced by URL. This post should include a photo of a sunset.</p>\n"
    end

    it "Create an h-entry post with a nested object (JSON)" do
      params = {
        type: [
          "h-entry"
        ],
        properties: {
          published: [
            "2017-05-31T12:03:36-07:00"
          ],
          content: [
            "Lunch meeting"
          ],
          checkin: [
            {
              type: [
                "h-card"
              ],
              properties: {
                name: ["Los Gorditos"],
                url: ["https://foursquare.com/v/502c4bbde4b06e61e06d1ebf"],
                latitude: [45.524330801154],
                longitude: [-122.68068808051],
                "street-address": ["922 NW Davis St"],
                locality: ["Portland"],
                region: ["OR"],
                "country-name": ["United States"],
                "postal-code": ["97209"]
              }
            }
          ]
        }
      }

      post "/micropub", params

      expect(last_response).to be_successful
      expect(post_repo.places_listing.count).to eq 1
      expect(post_repo.places_listing.first.post_type).to eq "checkin"
      expect(post_repo.places_listing.first.content).to eq "<p>Lunch meeting</p>\n"
    end

    it "Create an h-entry post with a photo with alt text (JSON)" do
      params = {
        type: ["h-entry"],
        properties: {
          content: ["Micropub test of creating a photo referenced by URL with alt text. This post should include a photo of a sunset."],
          photo: [
            {
              value: "https://micropub.rocks/media/sunset.jpg",
              alt: "Photo of a sunset"
            }
          ]
        }
      }

      post "/micropub", params

      expect(last_response).to be_successful
      expect(post_repo.statuses_listing.count).to eq 1
      expect(post_repo.statuses_listing.first.photos.count).to eq 1
      expect(post_repo.statuses_listing.first.content).to eq "<p>Micropub test of creating a photo referenced by URL with alt text. This post should include a photo of a sunset.</p>\n"
    end

    it "Create an h-entry with multiple photos referenced by URL (JSON)" do
      params = {
        type: ["h-entry"],
        properties: {
          content: ["Micropub test of creating multiple photos referenced by URL. This post should include a photo of a city at night."],
          photo: [
            "https://micropub.rocks/media/sunset.jpg",
            "https://micropub.rocks/media/city-at-night.jpg"
          ]
        }
      }

      post "/micropub", params

      expect(last_response).to be_successful
      expect(post_repo.statuses_listing.count).to eq 1
      expect(post_repo.statuses_listing.first.photos.count).to eq 2
      expect(post_repo.statuses_listing.first.content).to eq "<p>Micropub test of creating multiple photos referenced by URL. This post should include a photo of a city at night.</p>\n"
    end
  end

  context "bookmarks" do
    it "is successful" do
      params = {
        h: "entry",
        "bookmark-of": "http://example.com",
        name: "Name",
        content: "Content of the post",
        cache: "true"
      }

      post "/micropub", params

      expect(last_response).to be_successful
      expect(post_repo.bookmark_listing.count).to eq 1
      expect(post_repo.bookmark_listing.last.cached_content).to_not eq nil
    end

    it "validates an already bookmarked URL" do
      params = {
        h: "entry",
        "bookmark-of": "http://example.com",
        name: "Name",
        content: "Content of the post",
        cache: "true"
      }

      post "/micropub", params

      expect(last_response).to be_successful
      expect(post_repo.bookmark_listing.count).to eq 1
      expect(post_repo.bookmark_listing.last.cached_content).to_not eq nil
      
      post "/micropub", params
      expect(last_response).to_not be_successful
      expect(post_repo.bookmark_listing.count).to eq 1
    end
  end

  context "checkins" do
    it "is successful" do
      json = '{
    "type": [
        "h-entry"
    ],
    "properties": {
        "published": [
            "2023-02-25T10:24:30+11:00"
        ],
        "syndication": [
            "https://www.swarmapp.com/user/1390949/checkin/63f9472ed36fa977ac188903"
        ],
        "content": [
            "Coffee time!!"
        ],
        "category": [
            "check-in"
        ],
        "checkin": [
            {
                "type": [
                    "h-card"
                ],
                "properties": {
                    "name": [
                        "St Rose"
                    ],
                    "url": [
                        "https://foursquare.com/v/527da837498e9d7fee64bb75",
                        "http://www.strose.com.au"
                    ],
                    "tel": [
                        "(03) 9331 4488"
                    ],
                    "latitude": [
                        -37.75627
                    ],
                    "longitude": [
                        144.91555
                    ],
                    "street-address": [
                        "19 Rose St"
                    ],
                    "locality": [
                        "Essendon"
                    ],
                    "region": [
                        "VIC"
                    ],
                    "country-name": [
                        "Australia"
                    ],
                    "postal-code": [
                        "3040"
                    ]
                },
                "value": "https://foursquare.com/v/527da837498e9d7fee64bb75"
            }
        ],
        "location": [
            {
                "type": [
                    "h-adr"
                ],
                "properties": {
                    "latitude": [
                        -37.75627
                    ],
                    "longitude": [
                        144.91555
                    ],
                    "street-address": [
                        "19 Rose St"
                    ],
                    "locality": [
                        "Essendon"
                    ],
                    "region": [
                        "VIC"
                    ],
                    "country-name": [
                        "Australia"
                    ],
                    "postal-code": [
                        "3040"
                    ]
                }
            }
        ]
    }
}'
      params = JSON.parse(json, symbolize_names: true)

      post "/micropub", params
      expect(last_response).to be_successful
    end
  end

  context "auth" do
    it "does not allow multiple auth methods" do
      params = {
        access_token: "foo"
      }

      post "/micropub", params, "HTTP_AUTHORIZATION" => "Bearer foo"

      expect(last_response.status).to eq 400
    end
  end
end
