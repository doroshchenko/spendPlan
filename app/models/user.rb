class User < ActiveRecord::Base
  has_many  :user_incomes, dependent: :destroy

  has_many :spend_category_users
  has_many :spend_categories,  :through => :spend_category_users
  has_many :spend_entries
  has_many :spend_categories,  :through => :spend_entries


  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
