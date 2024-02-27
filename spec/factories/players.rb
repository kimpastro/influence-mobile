FactoryBot.define do
  factory :player do
    name { Faker::Name.name }
    birthday { Faker::Date.birthday }
    gender { Player.genders.keys.sample }
    email { Faker::Internet.email }
    password { SecureRandom.hex }
  end
end
