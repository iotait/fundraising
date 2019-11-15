class Teacher < ApplicationRecord
  has_many :students
  belongs_to :school

  def sum
    sum = 0.0
    Student.where(teacher_id: id).each do |student|
      sum += student.sum
    end
    sum
  end
end
