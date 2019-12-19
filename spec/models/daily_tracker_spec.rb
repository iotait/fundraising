require "rails_helper"

describe DailyTracker do
  describe "initialize" do
    it "sets sum, count and minutes to zero" do
      tracker = DailyTracker.new

      expect(tracker.sum).to eq 0
      expect(tracker.count).to eq 0
      expect(tracker.minutes).to eq 0
    end
  end

  describe "tally" do
    it "correctly tallies the sum, count and minutes read" do
      tracker = DailyTracker.new
      school = FactoryBot.create(:school_with_teacher_student_and_donation)

      tracker.tally(school)

      expect(tracker.sum).to eq 100
      expect(tracker.count).to eq 1
      expect(tracker.minutes).to eq 0
    end

    it "excludes donations made yesterday" do
      tracker = DailyTracker.new
      school = FactoryBot.create(:school_with_teacher_student_and_donation)
      donation = school.students.first.donations.first
      donation.created_at = DateTime.now - 1.day
      donation.save

      tracker.tally(school)

      expect(tracker.sum).to eq 0
      expect(tracker.count).to eq 0
      expect(tracker.minutes).to eq 0
    end
  end
end
