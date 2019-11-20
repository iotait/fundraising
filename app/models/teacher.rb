class Teacher < User
  has_many :students
  belongs_to :school

  validates :school_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :goal, presence: true

  def sum
    sum = 0.0
    Student.where(teacher_id: id).each do |student|
      sum += student.sum
    end
    sum
  end
end
