class DailyTracker
  attr_reader :sum, :count, :minutes

  def initialize
    @sum = 0.0
    @count = 0
    @minutes = 0
  end

  def tally(school)
    tally_donations(school)
    tally_minutes_read(school)
  end

  private

  def tally_donations(school)
    school.combined_donations.each do |donation|
      if donation.created_at.to_date == Date.today
        @sum += donation.amount
        @count += 1
      end
    end
  end

  def tally_minutes_read(school)
    school.students.each do |student|
      @minutes += student.mins_read_today
    end
  end
end
