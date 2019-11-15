class RemoveSchoolIdFromStudents < ActiveRecord::Migration[6.0]
  def change

    remove_column :students, :School_id, :integer
  end
end
