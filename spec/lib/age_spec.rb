require 'rails_helper'

RSpec.describe Age do
  context ".from" do
    let(:birtday)       { Date.new(1987, 01, 01) }
    let(:travel_to_day) { Time.new("2010-02-02") }
    
    it "should return the age" do
      travel_to(travel_to_day) do
        expect(Age.from(birtday)).to eq(23)
      end
    end
  end
end
