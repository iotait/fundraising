FactoryBot.define do
  factory :school do
    name { "xyz school" }
    email { "xyz@gmail.com" }
    phone { "5403212345" }
    address { "321 school ln" }
    about { "We want new desks" }
    goal { 200 }

    association :admin

    factory :school_with_teacher_and_student do
      after(:create) do |school|
        create(:teacher_with_student, school: school)
      end
    end

    factory :school_with_teacher_student_and_donation do
      after(:create) do |school|
        create(:teacher_with_student_and_donation, school: school)
      end
    end
  end
end