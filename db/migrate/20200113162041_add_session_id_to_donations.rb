class AddSessionIdToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :session_id, :string
  end
end
