class School < ApplicationRecord
  has_many :students
  belongs_to :admin

  validates :admin_id, presence: true
  validates :name, presence: true

  def sum
    sum = 0.0
    students.each do |student|
      sum += student.sum
    end
    sum
  end
end
