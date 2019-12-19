class Student < User
  require "csv"
  has_many :donations, as: :donatable
  has_many :reading_sessions
  belongs_to :teacher

  validates :teacher_id, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Student.create! row.to_hash
    end
  end

  def sum
    donations.to_a.inject(0) { |sum, donation| sum + donation.amount }
  end

  def mins_read
    reading_sessions.to_a.inject(0) { |time, session| time + session.time }
  end

  def mins_read_today
    time = 0
    reading_sessions.where(created_at: Date.today.all_day).each do |session|
      time += session.time
    end
    time
  end
end
