FactoryBot.define do
  factory :teacher do
    first_name { "Sue" }
    last_name { "Johnson" }
    email { "Sue@gmail.com" }
    phone { "5403212345" }
    goal { 200 }

    association :school

    factory :teacher_with_student do
      after(:create) do |teacher|
        create(:student, teacher: teacher)
      end
    end

    factory :teacher_with_student_and_donation do
      after(:create) do |teacher|
        create(:student_with_donation, teacher: teacher)
      end
    end
  end
end