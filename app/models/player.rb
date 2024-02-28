class Player < ApplicationRecord
  include HasGender

  LEGAL_AGE = 21.freeze

  has_many :claimed_offers
  has_many :offers, through: :claimed_offers

  validates_presence_of :birthday

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  
  def age
    Age.from(birthday)
  end

  def minor?
    age < LEGAL_AGE
  end
end
