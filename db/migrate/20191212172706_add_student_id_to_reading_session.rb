class AddStudentIdToReadingSession < ActiveRecord::Migration[6.0]
  def change
    add_column :reading_sessions, :student_id, :integer
  end
end
