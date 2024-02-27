require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { build(:player, attributes) }
  let(:attributes) do
    {
      name:     Faker::Name.name,
      birthday: Faker::Date.birthday,
      gender:   Player.genders.keys.sample,
      email:    Faker::Internet.email,
      password: SecureRandom.hex,
    }
  end

  describe "attributes validations" do
    context 'when attributes are good' do
      it 'should be valid' do
        expect(player).to be_valid
      end
    end

    context 'when birthday is missing' do
      let(:attributes) { super().merge!(birthday: nil) }

      it 'should not be valid' do
        expect(player).to_not be_valid
      end

      it 'should has error message' do
        player.valid?

        expect(player.errors).to have_key(:birthday)
        expect(player.errors[:birthday]).to eq(["can't be blank"])
      end
    end

    context 'when gender is missing' do
      let(:attributes) { super().merge!(gender: nil) }

      it 'should not be valid' do
        expect(player).to_not be_valid
      end

      it 'should has error message' do
        player.valid?

        expect(player.errors).to have_key(:gender)
        expect(player.errors[:gender]).to eq(["is not included in the list"])
      end
    end
  end

  describe 'enums' do
    it 'should have gender' do
      expect(described_class.genders).to eq( { "male" => 1, "female" => 2 } )
    end
  end
end
