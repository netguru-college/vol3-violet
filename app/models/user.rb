class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length: { in: 2..20 }
  has_many :group_users
  has_many :groups, through: :group_users
end
