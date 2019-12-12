class AddStudentIdRefToReadingSessions < ActiveRecord::Migration[6.0]
  def change
    add_reference :reading_sessions, :student, index: true
  end
end
