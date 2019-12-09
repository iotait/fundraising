FactoryBot.define do
  factory :user do
    first_name { "user" }
    sequence(:last_name) { |n| n.to_s }
    sequence(:email) { |n| "user#{n}@test.com" }
    password { "password" }

    factory :student, class: Student, parent: :user do
      association :teacher

      factory :student_with_donation do
        after(:create) do |student|
          create(:donation, student: student)
        end
      end
    end

    factory :teacher, class: Teacher, parent: :user do
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

    factory :admin, class: Admin, parent: :user do
    end
  end
end
