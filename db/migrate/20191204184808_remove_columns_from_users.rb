class RemoveColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :admin_id, :integer

    remove_column :users, :teacher_id, :integer

    remove_column :users, :goal, :string
  end
end
