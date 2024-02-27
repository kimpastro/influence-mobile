class Offer < ApplicationRecord
  include HasGender

  validates_presence_of :age
end
