class SpendCategory < BaseModel
  has_many :spend_category_users
  has_many :users, :through => :spend_category_users

  validates :name, presence: true
  validates :description, presence: true
  validates :default_amount, presence: true, numericality: {only_integer: true}

  def self.set_default_categories user
    default_categories = SpendCategory.where(is_default: true)
    # summ cat amount should be 100. user can allocate amounts between categories.
    default_categories.each do |cat|
      if user && user.kind_of?(User)
        user_category = user.spend_category_users.create(spend_category: cat)
        user_category.amount = cat.default_amount
        user_category.save
      end
    end
  end
end
