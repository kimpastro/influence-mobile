class OffersController < ApplicationController
  def index
    @pagy_claimed, @claimed_offers = pagy(current_player.offers)
    @pagy_targeted, @targeted_offers = pagy(offer_finder.targeted)
    @pagy_may_interest, @may_interest_offers = pagy(offer_finder.may_interest)
  end

  private

  def offer_finder
    @_offer_finder ||= OfferFinder.new(current_player)
  end
end
