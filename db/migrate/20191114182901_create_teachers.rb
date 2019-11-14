class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.float :goal

      t.timestamps
    end
  end
end
