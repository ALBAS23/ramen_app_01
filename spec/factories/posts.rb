FactoryBot.define do
  factory :post do
    menu                { Faker::Lorem.sentence }
    store               { Faker::Lorem.sentence }
    price               { Faker::Number.between(from: 0, to: 3000) } 
    genre_id            { Faker::Number.between(from: 2, to: 10) }
    word                { Faker::Lorem.sentence } 
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    association :user
  end
end
