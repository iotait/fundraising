class School < ApplicationRecord
  has_many :teachers
  belongs_to :admin

  validates :admin_id, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :about, presence: true
  validates :goal, presence: true

  def sum
    sum = 0.0
    Teacher.where(school_id: id).each do |teacher|
      sum += teacher.sum
    end
    sum
  end
end
