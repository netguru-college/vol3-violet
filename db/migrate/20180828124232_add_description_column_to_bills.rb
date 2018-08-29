class AddDescriptionColumnToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :title, :string
  end
end
