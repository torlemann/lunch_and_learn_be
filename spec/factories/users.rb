FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::DcComics.name }
  end
end
