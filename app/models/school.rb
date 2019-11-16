class School < ApplicationRecord
  has_many :students
  has_many :teachers
  belongs_to :admin

  def sum
    sum = 0.0
    Teacher.where(school_id: id).each do |teacher|
      sum += teacher.sum
    end
    sum
  end
end
