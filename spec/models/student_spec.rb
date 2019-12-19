require "rails_helper"

describe Student do
  describe "associations" do
    it { should belong_to(:teacher).class_name("Teacher") }
    it { should have_many(:donations).class_name("Donation") }
    it { should have_many(:reading_sessions).class_name("ReadingSession") }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end

  describe "calculating sum" do
    it "sums one hundred when a $100 donation has been made" do
      student = FactoryBot.create(:student_with_donation)

      expect(student.sum).to eq 100
    end

    it "sums zero when no donations have been made" do
      student = FactoryBot.build_stubbed(:student)
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

      expect(student.mins_read).to eq 10
    end
  end

  describe "minutes read today" do
    it "equals zero when a student hasn't read today" do
      student = FactoryBot.build_stubbed(:student)

      expect(student.mins_read_today).to eq 0
    end

    it "equals zero when a student only read yesterday" do
      student = FactoryBot.create(:student_with_reading_session)
      session = student.reading_sessions.first
      session.created_at = DateTime.now - 1.day
      session.save

      expect(student.mins_read_today).to eq 0
    end

    it "equals ten when a student read ten minutes today" do
      student = FactoryBot.create(:student_with_reading_session)

      expect(student.mins_read_today).to eq 10
    end
  end
end
