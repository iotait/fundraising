FactoryBot.define do
  factory :school do
    name { "xyz school" }
    email { "xyz@gmail.com" }
    phone { "5403212345" }
    address { "321 school ln" }
    about { "We want new desks" }
    goal { 200 }

    association :admin
  end
end