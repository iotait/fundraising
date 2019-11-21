FactoryBot.define do
  factory :teacher do
    first_name { "Sue" }
    last_name { "Johnson" }
    email { "Sue@gmail.com" }
    phone { "5403212345" }
    goal { 200 }

    association :school
  end
end