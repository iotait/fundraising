class CreateReadingSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :reading_sessions do |t|
      t.integer :time

      t.timestamps
    end
  end
end
