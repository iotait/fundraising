class School < ApplicationRecord
  has_many :students
  has_many :teachers

  def sum
    sum = 0.0
    Teacher.where(school_id: id).each do |teacher|
      sum += teacher.sum
    end
    sum
  end
end
