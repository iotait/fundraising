class Student < User
  has_many :donations
  belongs_to :school

  validates :school_id, presence: true

  def sum
    sum = 0.0
    donations.each do |donation|
      sum += donation.amount
    end
    sum
  end
end
