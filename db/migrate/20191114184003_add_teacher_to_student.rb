class AddTeacherToStudent < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :teacher, index: true
  end
end
