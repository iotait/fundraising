class Teacher < User
  require "csv"
  has_many :students
  belongs_to :school

  validates :school_id, presence: true

  def sum
    students.to_a.inject(0) { |sum, student| sum + student.sum }
  end

  def self.import(file, school_id)
    CSV.foreach(file.path, headers: true) do |row|
      row << {school_id: school_id}
      Teacher.create! row.to_hash
    end
  end

  def add_reading_session(time, student_id)
    ReadingSession.create!(student_id: student_id, time: time)
  end

  def add_reading_session_for_class(time, student_ids)
    student_ids.each do |student_id|
      add_reading_session(time, student_id)
    end
  end

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
end
