module HasGender
  extend ActiveSupport::Concern

  included do
    enum gender: { male: 1, female: 2 }

    validates :gender, inclusion: { in: genders }
  end
end
