require "rails_helper"

describe Donation do
  describe "associations" do
    it { should belong_to(:student).class_name("Student") }
  end

  describe "validations" do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:donor) }
  end
end
