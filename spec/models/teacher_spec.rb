require "rails_helper"

describe Teacher do
  describe 'associations' do
    it { should belong_to(:school).class_name("School") }
    it { should have_many(:students).class_name("Student") }
  end

  describe "validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:goal)}
    it {should validate_presence_of(:email)}
  end

  describe "calculating sum" do
    it "adds donations to get the sum" do
      teacher = FactoryBot.create(:teacher_with_student_and_donation)
      expect(teacher.sum).to eq 100
    end

    it "sums zero when no donations have been made" do
      teacher = FactoryBot.create(:teacher_with_student)
      expect(teacher.sum).to eq 0.0
    end
  end
end