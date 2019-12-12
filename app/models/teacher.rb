class Teacher < User
  require "csv"
  has_many :students
  belongs_to :school

  validates :school_id, presence: true

  def sum
    sum = 0.0
    students.each do |student|
      sum += student.sum
    end
    sum
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
end
