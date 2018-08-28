class RenameStatusInDebtsToPaid < ActiveRecord::Migration[5.2]
  def change
  	rename_column :debts, :status, :paid
  end
end
