class Donation < ApplicationRecord
  belongs_to :student

  validates :amount, presence: true
  validates :donor, presence: true
  validates :message, presence: true
  validates :student_id, presence: true
end
