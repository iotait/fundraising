class RemoveStudentIdFromReadingSessions < ActiveRecord::Migration[6.0]
  def change

    remove_column :reading_sessions, :student_id, :integer
  end
end
