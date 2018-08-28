class RenameTypeColumnInBillsToSplitType < ActiveRecord::Migration[5.2]
  def change
  	rename_column :bills, :type, :split_type
  end
end
