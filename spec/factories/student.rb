FactoryBot.define do
  factory :student do
    first_name { "student" }
    sequence(:last_name) { |n| n.to_s }
    sequence(:email) { |n| "student#{n}@test.com" }
    password { "password" }

    association :school
    # association :teacher

    factory :student_with_donation do
      after(:create) do |student|
        create(:donation, student: student)
      end
    end
  end
end
