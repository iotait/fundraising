class Donation < ApplicationRecord
  belongs_to :donatable, polymorphic: true

  validates :amount, presence: true
  validates :donor, presence: true
end
