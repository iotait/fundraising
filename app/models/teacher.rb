class Teacher < User
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
end