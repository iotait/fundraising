class Admin < User
  has_one :school
  has_many :teachers, through: :school
  has_many :students, through: :teachers

  def todays_tallies
    todays_tallies = DailyTracker.new
    todays_tallies.tally(school)

    todays_tallies
  end
end
