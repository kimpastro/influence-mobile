FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    birthday { Faker::Date.birthday }
    gender { Player.genders.keys.sample }
    email { Faker::Internet.email }
    password { SecureRandom.hex }

    trait :man do
      gender { Player.genders[:male] }
    end

    trait :woman do
      gender { Player.genders[:female] }
    end
  end
end
