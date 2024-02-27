FactoryBot.define do
  factory :offer do
    gender { Offer.genders.values.sample }
    description { Faker::Marketing.buzzwords }

    trait :for_legal_age do
      age { 21 }
    end

    trait :for_minors do
      age { 10 }
    end

    trait :for_men do
      gender { Offer.genders[:male] }
    end

    trait :for_women do
      gender { Offer.genders[:female] }
    end
  end
end
