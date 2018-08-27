class Bill < ApplicationRecord
  belongs_to :payer, foreign_key: 'user_id', class_name: 'User', inverse_of: :bill
  has_many   :debts
  has_many   :borrowers, through: :debts
end
