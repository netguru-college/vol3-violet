class RenameUserIdColumnInBillsToPayerId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :bills, :user_id, :payer_id
  end
end
