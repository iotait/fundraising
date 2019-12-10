class School < ApplicationRecord
  belongs_to :admin
  has_many :teachers
  has_many :students, through: :teachers

  validates :admin_id, presence: true
  validates :name, presence: true

  def sum
    sum = 0.0
    teachers.each do |teacher|
      sum += teacher.sum
    end
    sum
  end
end
