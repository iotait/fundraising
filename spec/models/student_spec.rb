require "rails_helper"

describe Student do
  describe "associations" do
    it { should belong_to(:teacher).class_name("Teacher") }
    it { should have_many(:donations).class_name("Donation") }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end

  describe "calculating sum" do
    it "adds donations to get the sum" do
      student = FactoryBot.create(:student_with_donation)

      expect(student.sum).to eq 100
    end

    it "sums zero when no donations have been made" do
      student = FactoryBot.create(:student)
      expect(student.sum).to eq 0.0
    end
  end

  describe "minutes read" do
    it "equals zero when a student starts" do
      student = FactoryBot.build_stubbed(:student)

      expect(student.mins_read).to eq 0
    end

    it "equals ten when the student adds ten" do
      student = FactoryBot.create(:student_with_reading_session)
      student.reload

      expect(student.mins_read).to eq 10
    end

    it "equals ten when the teacher adds ten for just the student" do
      teacher = FactoryBot.create(:teacher)
      student = FactoryBot.create(:student, teacher_id: teacher.id)
      teacher.add_reading_session(10, student.id)
      student.reload

      expect(student.mins_read).to eq 10
    end

    it "equals ten when the teacher adds ten for the whole class" do
      teacher = FactoryBot.create(:teacher)
      student = FactoryBot.create(:student, teacher_id: teacher.id)
      student_ids = []
      student_ids << student.id
      teacher.add_reading_session_for_class(10, student_ids)
      student.reload

      expect(student.mins_read).to eq 10
    end
  end
end
