class Student < User
  has_many :donations
  belongs_to :school
  # belongs_to :teacher

  validates :school_id, presence: true
  # validates :teacher_id, presence: true

  def sum
    sum = 0.0
    Donation.where(student_id: id).each do |donation|
      sum += donation.amount
    end
    sum
  end
end
