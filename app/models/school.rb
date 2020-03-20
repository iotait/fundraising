class School < ApplicationRecord
  belongs_to :admin
  has_many :teachers
  has_many :students, through: :teachers
  has_many :donations, as: :donatable

  has_rich_text :about
  has_one_attached :avatar

  validates :admin_id, presence: true
  validates :name, presence: true

  def sum
    combined_donations.inject(0) { |sum, donation| sum + donation.amount }
  end

  def combined_donations
    all_donations = []
    all_donations += donations.to_a

    students.each do |student|
      all_donations += student.donations.to_a
    end
    all_donations
  end

  def combined_minutes_read
    minutes = 0
    students.each do |student|
      minutes += student.mins_read
    end
    minutes
  end

  def donations
    Donation.where(donatable_type: "School", donatable_id: id, status: "completed")
  end
end
