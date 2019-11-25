class RemoveEmailFromUser < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :email
  end
end
