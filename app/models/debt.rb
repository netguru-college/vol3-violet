class Debt < ApplicationRecord
  belongs_to :bill,     inverse_of: :debts,
                        class_name: 'Bill'
  belongs_to :borrower, class_name: 'User',
                        inverse_of: :debts_as_borrower

  scope :paid, lambda { where(paid: true) }
  scope :unpaid, lambda { where(paid: false) }

  def self.amount_grouped_by_payer
    includes(bill: [:payer]).group(:username).sum(:amount)
  end

  def self.amount_grouped_by_borrower
    includes(bill: [:borrowers]).group(:borrower).sum(:amount)
  end
end
