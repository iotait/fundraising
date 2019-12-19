class RemoveAboutFromSchools < ActiveRecord::Migration[6.0]
  def change
    remove_column :schools, :about, :string
  end
end
