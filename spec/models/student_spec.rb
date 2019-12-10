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
end
