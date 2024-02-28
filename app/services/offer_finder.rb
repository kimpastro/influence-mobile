class OfferFinder
  attr_reader :player

  MAX_HUMAM_AGE = 200.freeze

  def initialize(player)
    @player = player
  end

  def targeted
    offers_not_claimed.where(gender: player.gender, age: player.age)
  end
  
  def may_interest
    offers_not_claimed.where(gender: player.gender, age: min_legal_age..max_legal_age)
  end

  private

  def min_legal_age
    player.minor? ? 0 : Player::LEGAL_AGE
  end

  def max_legal_age
    player.minor? ? player.age : MAX_HUMAM_AGE
  end

  def offers_not_claimed
    Offer.where.not(id: player.offers)
  end
end
