FactoryBot.define do
  factory :person do
    gender                        { "男性" }
    prefecture_id                 { Faker::Number.between(from: 2, to: 48) }  
    f_store_one                   { "ラーメン店名①" }
    f_store_two                   { "ラーメン店名②" }
    f_store_three                 { "ラーメン店名③" }
    genre_id                      { Faker::Number.between(from: 2, to: 10) }
    f_topping                     { "キャベツ" }
    self_introduction             { Faker::Lorem.characters(number: 400) }
    association :user
  end
end
