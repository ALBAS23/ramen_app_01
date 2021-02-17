FactoryBot.define do
  factory :post do
    menu                { "チャーシュー麺" }
    store               { "店舗" }
    price               { Faker::Number.between(from: 0, to: 3000) } 
    genre_id            { Faker::Number.between{from: 2, to: 10 } }
    word                { Faker::Lorem.sentence } 
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
  end
end
