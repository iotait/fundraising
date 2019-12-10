class Admin < User
  has_one :school
  has_many :teachers, through: :school
  has_many :students, through: :teachers
end
