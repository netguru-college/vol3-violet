class AddCreatorIdToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :creator_id, :integer
    add_index :groups, :creator_id
  end
end
