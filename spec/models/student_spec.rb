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
      student = FactoryBot.create(:student)

      expect(student.mins_read).to eq 0
    end

    it "equals ten when the student adds ten" do
      student = FactoryBot.create(:student)
      student.increase_mins_read(10)

      expect(student.mins_read).to eq 10
    end

    it "equals ten when the teacher adds ten" do
      teacher = FactoryBot.create(:teacher)
      student = FactoryBot.create(:student, teacher_id: teacher.id)
      teacher.increase_mins_read(10)
      student.reload

      expect(student.mins_read).to eq 10
    end
  end
end
