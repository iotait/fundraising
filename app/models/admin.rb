class Admin < User
  has_one :school

  validates :phone, presence: true
end
