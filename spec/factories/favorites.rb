FactoryBot.define do
  factory :favorite do
    api_key { Faker::Alphanumeric.alphanumeric(number: 10) }
    country { Faker::Address.country }
    recipe_link { Faker::Internet.url }
    recipe_title { Faker::Food.dish }
  end
end
