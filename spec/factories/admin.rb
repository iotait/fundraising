FactoryBot.define do
  factory :admin do
    first_name { "Admin" }
    last_name { "Bob" }
    email { "xyz@gmail.com" }
    phone { "5403212345" }
  end
end