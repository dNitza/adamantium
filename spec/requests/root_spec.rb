# frozen_string_literal: true

RSpec.describe "Root", :requests do
  it "is successful" do
    get "/"

    expect(last_response).to be_successful
  end
end
