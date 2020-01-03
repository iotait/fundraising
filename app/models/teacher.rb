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

  def self.add_reading_session(time, student_id)
    ReadingSession.create!(student_id: student_id, time: time)
  end

  def self.add_reading_session_for_class(time, student_ids)
    student_ids.each do |student_id|
      Teacher.add_reading_session(time, student_id)
    end
  end
end
