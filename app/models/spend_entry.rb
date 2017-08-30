class SpendEntry < BaseModel
  belongs_to :user
  belongs_to :spend_category_user
end
