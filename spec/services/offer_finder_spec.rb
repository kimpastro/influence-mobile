require 'rails_helper'

RSpec.describe OfferFinder do
  let(:player) { create(:player, :man, birthday: birthday) }
  let(:offer) { create(:offer) }
  # It must have "- 1.day", because 10.years.ago is still an age of 9
  # as the current day is not over yet we need to buffer another day.
  let(:birthday) { age.years.ago - 1.day }
  
  describe 'methods' do
    describe '#targeted' do
      subject { described_class.new(player).targeted }

      let(:age) { 20 }

      context 'when one offer fits' do
        let!(:fit_offer) { create(:offer, :for_men, age: age) }
        let!(:not_fit_offer) { create(:offer, :for_women, age: age) }
        
        it 'should bring the correct offer' do
          expect(subject).to eq([fit_offer])
        end
      end
      
      context 'when multiple offer fits' do
        let!(:fit_offers) { 10.times.map { create(:offer, :for_men, age: age) } }
        let!(:not_fit_offer) { create(:offer, :for_women, age: age) }
        
        it "should bring all 10 offers" do
          expect(subject).to eq(fit_offers)
        end
      end

      context 'when any offer fits' do
        let(:not_fit_offer) { create(:offer, :for_women, age: age) }
        
        it "should be empty" do
          expect(subject).to be_empty
        end
      end
    end

    describe "#may_interest" do
      subject { described_class.new(player).may_interest }

      let!(:legal_age_offer) { create(:offer, :for_men, :for_legal_age) }
      let!(:minor_offer) { create(:offer, :for_men, :for_minors) }

      context "when it's a minor" do
        let(:age) { 20 }

        it 'should bring minor offers' do
          expect(subject).to eq([minor_offer])
        end
      end

      context "when it's a legal age" do
        let(:age) { 30 }
        
        it 'should bring legal offers' do
          expect(subject).to eq([legal_age_offer])
        end
      end
      
      context "when offer is claimed" do
        let!(:legal_age_offer_claimed) { create(:offer, :for_men, :for_legal_age, players: [player]) }
        let(:age) { 30 }
        
        it "should not appear" do
          expect(subject).to eq([legal_age_offer])
        end
      end
    end
  end
end
