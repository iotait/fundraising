class Admin < User
  has_one :school
  has_many :teachers, through: :school
  has_many :students, through: :teachers

  def todays_tallies
    todays_tallies = DailyTracker.new
    todays_tallies.tally(school)

    todays_tallies
  end

  #TODO Where does this go?
  require 'fuzzy_match'

  def search_students(search)
    middle = search.index(" ")
    student = nil

    #If there's a space, we know it's a well-formed name and will search
    if (middle.present?)
      first_name = search[0, middle]
      last_name = search[middle + 1, search.size]
      student = students.where(first_name: first_name, last_name: last_name)
    end

    #If we don't have a student by now, we will fuzzy search it
    if (student.blank?)
      fz = FuzzyMatch.new(students.all, :read => :first_name)
      student = students.where(first_name: fz.find(search).first_name)
    end

    return student
  end

  def search_teachers(search)
    middle = search.index(" ")
    teacher = nil

    #If there's a space, we know it's a well-formed name and will search
    if (middle.present?)
      first_name = search[0, middle]
      last_name = search[middle + 1, search.size]
      teacher = teachers.where(first_name: first_name, last_name: last_name)
    end

    #If we don't have a teacher by now, we will fuzzy search it
    if (teacher.blank?)
      fz = FuzzyMatch.new(teachers.all, :read => :first_name)
      teacher = teachers.where(first_name: fz.find(search).first_name)
    end

    return teacher
  end
end
