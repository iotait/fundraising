FactoryBot.define do
  factory :student do
    first_name { "Billy" }
    last_name { "Jack" }
    email { "bjack@gmail.com" }
    about { "I want to help my school's drive" }
    goal { 200 }

    association :teacher
  end
end