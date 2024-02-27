require 'rails_helper'

RSpec.describe Offer, type: :model do
  let(:offer) { build(:offer, attributes) }
  let(:attributes) do
    {
      gender: Offer.genders[:male],
      age: 0,
      description: Faker::Marketing.buzzwords,
    }
  end

  describe "validations" do
    context 'when attributes are good' do
      it 'should be valid' do
        expect(offer).to be_valid
      end
    end

    context 'when age is missing' do
      let(:attributes) { super().merge!(age: nil) }

      it 'should not be valid' do
        expect(offer).to_not be_valid
      end

      it 'should has error message' do
        offer.valid?

        expect(offer.errors).to have_key(:age)
        expect(offer.errors[:age]).to eq(["can't be blank"])
      end
    end

    context 'when gender is missing' do
      let(:attributes) { super().merge!(gender: nil) }

      it 'should not be valid' do
        expect(offer).to_not be_valid
      end

      it 'should has error message' do
        offer.valid?

        expect(offer.errors).to have_key(:gender)
        expect(offer.errors[:gender]).to eq(["is not included in the list"])
      end
    end
  end

  describe 'enums' do
    it 'should have gender' do
      expect(described_class.genders).to eq( { "male" => 1, "female" => 2 } )
    end
  end
end
