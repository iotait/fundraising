require "rails_helper"

describe School do
  describe "associations" do
    it { should belong_to(:admin).class_name("Admin") }
    it { should have_many(:students).class_name("Student") }
    # it { should have_many(:teachers).class_name("Teacher") }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  describe "calculating sum" do
    it "adds donations to get the sum" do
      school = FactoryBot.create(:school_with_student_and_donation)

      expect(school.sum).to eq 100
    end

    it "sums zero when no donations have been made" do
      school = FactoryBot.create(:school_with_student)
      expect(school.sum).to eq 0.0
    end
  end
end
