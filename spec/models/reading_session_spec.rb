require "rails_helper"

describe ReadingSession do
  describe "associations" do
    it { should belong_to(:student).class_name("Student") }
  end
end
