FactoryBot.define do
  factory :donation do
    amount { 100 }
    donor { "Grandpa" }
    message { "I hope you meet your goal!" }

    association :student
  end
end
