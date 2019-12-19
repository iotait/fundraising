require "rails_helper"

describe Donation do
  describe "validations" do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:donor) }
  end
end
