class SpendCategoryUser < ApplicationRecord
  belongs_to :user
  belongs_to :spend_category
end
