class RemoveSchoolIdFromTeachers < ActiveRecord::Migration[6.0]
  def change

    remove_column :teachers, :School_id, :integer
  end
end
