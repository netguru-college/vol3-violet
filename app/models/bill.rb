class Bill < ApplicationRecord
  belongs_to :payer,      class_name:  'User',
                          inverse_of:  :bills_as_payer
  has_many   :debts,      class_name:  'Debt',
                          foreign_key: 'bill_id',
                          inverse_of:  :bill
  has_many   :borrowers,  through:     :debts,
                          source:      :borrower,
                          inverse_of:  :bills_as_borrower
end