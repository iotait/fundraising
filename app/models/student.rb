class Student < User
  require "csv"
  has_many :donations
  belongs_to :teacher

  validates :teacher_id, presence: true

  def sum
    sum = 0.0
    donations.each do |donation|
      sum += donation.amount
    end
    sum
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Student.create! row.to_hash
    end
  end

  # def self.import(file, school_id)
  #   CSV.foreach(file.path, headers: true) do |row|
  #     row << {school_id: school_id}
  #     Student.create! row.to_hash
  #   end
  # end
end
