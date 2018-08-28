class RenameUserIdColumnInDebtsToBorrowerId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :debts, :user_id, :borrower_id
  end
end
