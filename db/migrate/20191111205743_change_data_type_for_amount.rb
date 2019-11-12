class ChangeDataTypeForAmount < ActiveRecord::Migration[6.0]
  def self.up
    change_table :donations do |t|
      t.change :amount, :float
    end
  end
  def self.down
    change_table :donations do |t|
      t.change :amount, :integer
    end
  end
end
