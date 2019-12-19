class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.float :amount
      t.string :donor
      t.string :message
      t.references :donatable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
