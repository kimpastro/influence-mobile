class OfferClaim
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def claim(offer)
    return false if already_claimed?(offer)
    return false unless age_allowed?(offer)

    player.offers << offer
  end

  private

  def already_claimed?(offer)
    return false unless player.offers.exists?(offer.id)

    player.errors.add(:offers, 'already claimed')
    true
  end
  
  def age_allowed?(offer)
    if player.minor? && offer.age > player.age
      player.errors.add(:age, 'not allowed')
      return false
    end

    true
  end
end
