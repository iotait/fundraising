require "rails_helper"

describe Admin do
  describe "associations" do
    it { should have_one(:school).class_name("School") }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
  end
end
