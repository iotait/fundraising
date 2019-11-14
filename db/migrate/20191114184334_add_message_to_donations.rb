class AddMessageToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :message, :string
  end
end
