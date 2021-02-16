FactoryBot.define do
  factory :user do
    nickname                  { Faker::Name.initials }
    email                     { Faker::Internet.email }
    password                  { Faker::Internet.password(min_length: 8) }
    password_confirmation     { password }
  end
end