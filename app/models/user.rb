class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  devise :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, invite_for: 2.weeks
  validates :username, presence: true, length: { in: 2..20 }

  has_many :group_users
  has_many :groups,            through: :group_users

  has_many :bills_as_payer,    class_name: 'Bill',
                               foreign_key: 'payer_id',
                               inverse_of: :payer

  has_many :debts_as_borrower, class_name: 'Debt',
                               foreign_key: 'borrower_id',
                               inverse_of: :borrower

  has_many :debts_as_payer,    through: :bills_as_payer,
                               source: :debts

  has_many :bills_as_borrower, through: :debts_as_borrower,
                               source: :bill,
                               inverse_of: :borrowers
  has_many :created_groups, foreign_key: :creator_id, class_name: 'Group', inverse_of: :users
end
