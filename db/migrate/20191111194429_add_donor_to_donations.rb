class AddDonorToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :donor, :string
  end
end
