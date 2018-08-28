class Debt < ApplicationRecord
  belongs_to :bill,     inverse_of: :debts,
                        class_name: 'Bill'
  belongs_to :borrower, class_name: 'User',
                        inverse_of: :debts_as_borrower

  scope :paid, lambda { where(paid: true) }
  scope :unpaid, lambda { where(paid: false) }
end
