class RemoveGoalFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :goal, :string
  end
end
