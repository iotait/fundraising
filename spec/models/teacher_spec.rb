require "rails_helper"

describe Teacher do
  describe 'associations' do
    it { should belong_to(:school).class_name('School') }
  end

  describe "validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:goal)}
    it {should validate_presence_of(:email)}
  end

  xdescribe "calculating sum" do
    it "adds donations to get the sum" do
      teacher = FactoryBot.build(:teacher)
      student = FactoryBot.build(:student)
      donation = FactoryBot.build(:donation)
      
      expect(teacher.sum).to eq 100
    end
  end
end