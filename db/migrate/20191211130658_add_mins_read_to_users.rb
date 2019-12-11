class AddMinsReadToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mins_read, :integer
  end
end
