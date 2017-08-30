class SpendCategoryUser < BaseModel
  belongs_to :user
  belongs_to :spend_category
  has_many :spend_entries
  has_many :users,  :through => :spend_entries

  def self.amount_to_spend id, month, year
    category = SpendCategoryUser.find(id)
    user_income = category.user.user_incomes
                      .by_month_year(month, year)
                      .sum(:amount)
    spend_category_amount = category.amount
    amount = user_income.to_i*(spend_category_amount.to_i/100.to_f)

  end

  def self.current_balance id, month, year
    total_spent = SpendCategoryUser.find(id)
                      .spend_entries
                      .by_month_year(month, year)
                      .sum(:amount)
    (amount_to_spend(id, month, year).to_f - total_spent.to_f).round(3)
  end
end


