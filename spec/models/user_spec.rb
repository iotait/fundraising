require "rails_helper"

describe User do
  describe "validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
  end

  describe "name" do
    it "joins first and last name together" do
      user = FactoryBot.create(:user)
      expect(user.name).to eq "User Bob"
    end
  end
end