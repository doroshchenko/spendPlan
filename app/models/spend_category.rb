class SpendCategory < ApplicationRecord
  has_many :spend_category_users
  has_many :users, :through => :spend_category_users


  def self.set_default_categories user
    default_categories = SpendCategory.where(is_default: true)
    default_categories.each do |cat|
      if user && user.kind_of?(User)
        user.spend_category_users.create(spend_category: cat)
      end
    end
  end
end
