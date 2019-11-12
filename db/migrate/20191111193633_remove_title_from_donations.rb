class RemoveTitleFromDonations < ActiveRecord::Migration[6.0]
  def change
    remove_column :donations, :title, :string
  end
end
