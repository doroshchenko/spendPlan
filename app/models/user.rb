class User < ActiveRecord::Base
  has_many  :user_incomes
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
