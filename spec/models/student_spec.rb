require "rails_helper"

describe Student do
  describe 'associations' do
    it { should belong_to(:teacher).class_name('Teacher') }
  end

  describe "validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:about)}
    it {should validate_presence_of(:goal)}
    it {should validate_presence_of(:email)}
  end

  xdescribe "calculating sum" do
    it "adds donations to get the sum" do
      donation = FactoryBot.build(:donation)

      expect(Student.first.sum).to eq 100
    end
  end
end