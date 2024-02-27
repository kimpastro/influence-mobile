class Player < ApplicationRecord
  include HasGender

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  validates_presence_of :birthday

  def age
    Age.from(birtday)
  end
end
