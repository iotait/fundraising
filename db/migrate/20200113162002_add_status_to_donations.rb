class AddStatusToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :status, :string
  end
end
