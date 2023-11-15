RSpec.describe Micropub::RequestParser do
  subject { described_class.new }

  context "json request" do
    context "HTML post" do
      let(:params) {
        {
          type: ["h-entry"],
          properties: {
            name: ["title"],
            content: [
              "Hello world"
            ]
          },
          category: ["ruby", "rspec"]
        }
      }

      it "parses the params in to the expected shape" do
        Timecop.freeze do
          result = subject.call(params: params)
          expect(result).to be_a Micropub::Entities::PostRequest
        end
      end
    end
  end

  context "form request" do
    let(:params) {
      {
        h: "entry",
        name: "title",
        content: "Hello world",
        category: ["ruby", "rspec"]
      }
    }

    it "parses the params in to the expected shape" do
      Timecop.freeze do
        result = subject.call(params: params)
        expect(result).to be_a Micropub::Entities::PostRequest
      end
    end
  end

  context "checkin request" do
    let(:params) {
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
      JSON.parse(json, symbolize_names: true)
    }
    it "parses the request" do
      Timecop.freeze do
        result = subject.call(params: params)
        expect(result).to be_a Micropub::Entities::CheckinRequest
      end
    end
  end
end
