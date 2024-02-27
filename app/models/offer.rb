class Offer < ApplicationRecord
  include HasGender

  validates_presence_of :min_age, :max_age
end
