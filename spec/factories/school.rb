FactoryBot.define do
  factory :school do
    sequence(:name) { |n| "school #{n}" }

    association :admin

    factory :school_with_student do
      after(:create) do |school|
        create(:student, school: school)
      end
    end

    factory :school_with_student_and_donation do
      after(:create) do |school|
        create(:student_with_donation, school: school)
      end
    end

    # factory :school_with_teacher_and_student do
    #   after(:create) do |school|
    #     create(:teacher_with_student, school: school)
    #   end
    # end

    # factory :school_with_teacher_student_and_donation do
    #   after(:create) do |school|
    #     create(:teacher_with_student_and_donation, school: school)
    #   end
    # end
  end
end
