class Admin < User
  has_one :school
  has_many :teachers, through: :school
  has_many :students, through: :teachers

  def todays_tallies
    todays_tallies = DailyTracker.new
    todays_tallies.tally(school)

    todays_tallies
  end

  def search_students(search)
    first_name = search[0, search.index(" ")]
    last_name = search[search.index(" ") + 1, search.size]

    students.where(first_name: first_name, last_name: last_name)
  end

  def search_teachers(search)
    first_name = search[0, search.index(" ")]
    last_name = search[search.index(" ") + 1, search.size]

    teachers.where(first_name: first_name, last_name: last_name)
  end
end
