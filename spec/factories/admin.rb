FactoryBot.define do
  factory :admin do
    first_name { "admin" }
    sequence(:last_name) { |n| n.to_s }
    sequence(:email) { |n| "admin#{n}@test.com" }
    password { "password" }
  end
end
