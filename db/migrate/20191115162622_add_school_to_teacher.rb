class AddSchoolToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_reference :teachers, :school, index: true
  end
end
