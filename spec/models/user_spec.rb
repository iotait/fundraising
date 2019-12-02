require "rails_helper"

describe User do
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end

  describe "name" do
    it "joins first and last name together" do
      user = FactoryBot.create(:user)
      expect(user.name).to eq user.first_name + " " + user.last_name
    end
  end

  describe "creating a new user" do
    it "validates the uniqueness of email" do
      original = FactoryBot.create(:user, email: "test@test.com")
      duplicate = FactoryBot.build(:user, email: original.email)
      duplicate.valid?
      expect(duplicate.errors[:email]).to include "has already been taken"
    end
  end
end
