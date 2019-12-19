require "rails_helper"

describe School do
  describe "associations" do
    it { should belong_to(:admin).class_name("Admin") }
    it { should have_many(:teachers).class_name("Teacher") }
    it { should have_many(:students).class_name("Student") }
    it { should have_many(:donations).class_name("Donation") }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "calculating sum" do
    it "sums one hundred when a $100 donation has been made" do
      school = FactoryBot.create(:school_with_teacher_student_and_donation)

      expect(school.sum).to eq 100
    end

    it "sums zero when no donations have been made" do
      school = FactoryBot.build_stubbed(:school_with_teacher_and_student)

      expect(school.sum).to eq 0.0
    end
  end

  describe "combined donations" do
    it "include donations made to the school and to students" do
      school = FactoryBot.create(:school)
      teacher = FactoryBot.create(:teacher, school_id: school.id)
      student = FactoryBot.create(:student, teacher_id: teacher.id)

      Donation.create(donatable_type: "School", donatable_id: school.id, donor: "test", amount: 100)
      Donation.create(donatable_type: "User", donatable_id: student.id, donor: "test", amount: 100)

      expect(school.combined_donations.count).to eq 2
    end
  end
end
