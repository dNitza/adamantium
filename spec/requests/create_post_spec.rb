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
      expect(post_repo.statuses_listing.count).to eq 1
      expect(post_repo.statuses_listing.first.tags.map(&:label)).to eq ["ruby", "rspec"]
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
