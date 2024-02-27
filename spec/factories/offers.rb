FactoryBot.define do
  factory :offer do
    gender { Offer.genders.values.sample }
    description { Faker::Marketing.buzzwords }

    trait :for_legal_age do
      min_age { 21 }
      max_age { 199 }
    end

    trait :for_minors do
      min_age { 0 }
      max_age { 20 }
    end

    trait :for_men do
      gender { Offer.genders[:male] }
    end

    trait :for_women do
      gender { Offer.genders[:female] }
    end
  end
end
