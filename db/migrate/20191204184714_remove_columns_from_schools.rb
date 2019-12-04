class RemoveColumnsFromSchools < ActiveRecord::Migration[6.0]
  def change
    remove_column :schools, :address, :string

    remove_column :schools, :email, :string

    remove_column :schools, :phone, :string
  end
end
