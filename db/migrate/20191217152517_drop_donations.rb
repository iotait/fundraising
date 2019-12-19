class DropDonations < ActiveRecord::Migration[6.0]
  def change
    drop_table :donations
  end
end
