class AddadminToschool < ActiveRecord::Migration[6.0]
  def change
    add_reference :schools, :admin, index: true
  end
end
