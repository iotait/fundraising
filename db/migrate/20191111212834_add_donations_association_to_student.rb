class AddDonationsAssociationToStudent < ActiveRecord::Migration[6.0]
  def self.up
    add_column :donations, :student_id, :integer
    add_index "donations", ["student_id"], name: "index_student_id"
  end

  def self.down
  end
end
