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

  def increase_mins_read(minutes)
    students.each do |student|
      student.increase_mins_read(minutes)
    end
  end
end
