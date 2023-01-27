RSpec.describe Adamantium::MicropubRequestParser do
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
          expect(result).to be_a Adamantium::Entities::PostRequest
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
        expect(result).to be_a Adamantium::Entities::PostRequest
      end
    end
  end
end
