class Student < User
  has_many :donations
  belongs_to :teacher

  validates :teacher_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :about, presence: true
  validates :goal, presence: true

  def sum
    sum = 0.0
    Donation.where(student_id: id).each do |donation|
      sum += donation.amount
    end
    sum
  end
end
