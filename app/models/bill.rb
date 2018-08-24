class Bill < ApplicationRecord
  belongs_to :payer, class_name: 'User'
  # has_many   :borrower, class_name: 'User'
end
