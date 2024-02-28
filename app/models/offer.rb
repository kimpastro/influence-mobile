class Offer < ApplicationRecord
  include HasGender

  has_many :claimed_offers
  has_many :players, through: :claimed_offers

  validates_presence_of :age
end
