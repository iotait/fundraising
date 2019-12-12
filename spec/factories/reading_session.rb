FactoryBot.define do
  factory :reading_session do
    time { 10 }

    association :student
  end
end
