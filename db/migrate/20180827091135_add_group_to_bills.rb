class AddGroupToBills < ActiveRecord::Migration[5.2]
  def change
    add_reference :bills, :group, foreign_key: true
  end
end
