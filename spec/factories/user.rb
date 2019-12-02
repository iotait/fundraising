FactoryBot.define do
  factory :user do
    first_name { "user" }
    sequence(:last_name) { |n| n.to_s }
    sequence(:email) { |n| "user#{n}@test.com" }
    password { "password" }
  end
end
