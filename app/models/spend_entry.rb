class SpendEntry < ApplicationRecord
  belongs_to :user
  belongs_to :spend_category_user
end
