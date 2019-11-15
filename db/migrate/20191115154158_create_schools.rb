class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :about
      t.float :goal

      t.timestamps
    end
  end
end
