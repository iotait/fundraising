class Student < ApplicationRecord
  has_many :donations
  belongs_to :teacher
  belongs_to :school

  def sum
    sum = 0.0
    Donation.where(student_id: id).each do |donation|
      sum += donation.amount
    end
    sum
  end
end
