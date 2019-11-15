class AddSchoolToStudent < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :school, index: true
  end
end
