require "rails_helper"

describe Admin do
  describe "associations" do
    it { should have_one(:school).class_name("School") }
    it { should have_many(:teachers).class_name("Teacher") }
    it { should have_many(:students).class_name("Student") }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end

  describe "todays tallies" do
    it "sums donations correctly" do
      admin = FactoryBot.create(:admin_with_school_teacher_student_donation)

      expect(admin.todays_tallies.sum).to eq 100
    end

    it "counts donations correctly" do
      admin = FactoryBot.create(:admin_with_school_teacher_student_donation)

      expect(admin.todays_tallies.count).to eq 1
    end

    it "sums minutes read correctly" do
      admin = FactoryBot.create(:admin_with_school_teacher_student_reading_session)

      expect(admin.todays_tallies.minutes).to eq 10
    end
  end
end
