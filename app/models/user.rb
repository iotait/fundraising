class User < ApplicationRecord
  scope :admins, -> { where(type: "Admin") }
  scope :teachers, -> { where(type: "Teacher") }
  scope :students, -> { where(type: "Student") }

  def name
    first_name + " " + last_name
  end
end
