FactoryBot.define do
  factory :meal do
    name { Faker::Food.dish }
    description { Faker::Lorem.paragraph }
  end
end
