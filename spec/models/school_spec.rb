require "rails_helper"

describe School do
  describe 'associations' do
    it { should belong_to(:admin).class_name('Admin') }
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:about)}
    it {should validate_presence_of(:goal)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:address)}
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