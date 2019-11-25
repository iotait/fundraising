class User < ApplicationRecord
  scope :admins, -> { where(type: "Admin") }
  scope :teachers, -> { where(type: "Teacher") }
  scope :students, -> { where(type: "Student") }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def name
    first_name + " " + last_name
  end
end
