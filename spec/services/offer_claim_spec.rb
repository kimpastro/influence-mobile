require 'rails_helper'

RSpec.describe OfferClaim do
  let(:player)   { create(:player, birthday: birthday) }
  let(:birthday) { age.years.ago - 1.day }
  let(:age)      { 21 }
  
  describe '#claim' do
    subject { described_class.new(player).claim(offer) }

    context 'when offer is allowed to be claimed' do
      let(:offer) { create(:offer, gender: player.gender, age: player.age) }

      it 'should claim offer to player' do
        expect { subject }.to change(player.offers, :count).by(1)
      end
    end

    context 'offer already claimed' do
      let(:offer) { create(:offer, players: [player]) }

      it 'should return false' do
        expect(subject).to be_falsy
      end
      
      it 'should add error to player model' do
        subject
        expect(player.errors).to have_key(:offers)
        expect(player.errors[:offers]).to eq(['already claimed'])
      end
    end
    
    context 'offer age not allowed' do
      let(:offer) { create(:offer, gender: player.gender, age: Player::LEGAL_AGE) }
      let(:age)   { 10 }
      
      it 'should return false' do
        expect(subject).to be_falsy
      end

      it 'should add error to player model' do
        subject
        expect(player.errors).to have_key(:age)
        expect(player.errors[:age]).to eq(['not allowed'])
      end
    end
  end
end


