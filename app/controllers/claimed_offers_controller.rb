class ClaimedOffersController < ApplicationController
  before_action :find_offer, only: [:create]

  def index
    @pagy_claimed, @claimed_offers = pagy(current_player.offers)
  end

  def create
    offer_claim = OfferClaim.new(current_player)
    
    if offer_claim.claim(@offer)
      redirect_to offers_path, notice: 'Offer claimed successfully'
    else
      redirect_to offers_path, alert: current_player.show_errors
    end
  end

  private

  def offer_id_param
    params.require(:offer_id)
  end

  def find_offer
    @offer = Offer.find(offer_id_param)
  end
end
