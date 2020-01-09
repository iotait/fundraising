require "rails_helper"

describe Teacher do
  describe "associations" do
    it { should belong_to(:school).class_name("School") }
    it { should have_many(:students).class_name("Student") }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end

  describe "calculating sum" do
    it "sums one hundred when a $100 donation has been made" do
      teacher = FactoryBot.create(:teacher_with_student_and_donation)
      expect(teacher.sum).to eq 100
    end

    it "sums zero when no donations have been made" do
      teacher = FactoryBot.build_stubbed(:teacher_with_student)
      expect(teacher.sum).to eq 0.0
    end
  end

  describe "adding a reading session for a student" do
    it "increases a student's minutes read" do
      teacher = FactoryBot.create(:teacher)
      student = FactoryBot.create(:student, teacher_id: teacher.id)

      teacher.add_reading_session(10, student.id)
      expect(student.mins_read).to eq 10
    end
  end

  describe "adding a reading session for a class" do
    it "increases all student's minutes read" do
      teacher = FactoryBot.create(:teacher)
      student1 = FactoryBot.create(:student, teacher_id: teacher.id)
      student2 = FactoryBot.create(:student, teacher_id: teacher.id)

      teacher.add_reading_session_for_class(10, [student1.id, student2.id])

      expect(student1.mins_read).to eq 10
      expect(student2.mins_read).to eq 10
    end
  end
end
