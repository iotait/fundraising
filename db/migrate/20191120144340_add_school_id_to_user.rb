class AddSchoolIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :school_id, :int
  end
end
