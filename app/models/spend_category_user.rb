class SpendCategoryUser < ApplicationRecord
  belongs_to :user
  belongs_to :spend_category
  has_many :spend_entries
  has_many :users,  :through => :spend_entries
end
