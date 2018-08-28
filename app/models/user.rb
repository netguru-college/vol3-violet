class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :omniauthable,	omniauth_providers:	[:facebook]

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

  def self.from_omniauth(auth)
    where(provider:	auth.provider, uid: auth.uid).first_or_create	do |user|
      user.email = auth.info.email
      # user.password = Devise.friendly_token[0, 20]
    end
  end
end
