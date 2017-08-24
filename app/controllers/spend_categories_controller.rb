class SpendCategoriesController < ApplicationController
  def index
    @category = SpendCategory.new
    @user_categories = current_user.spend_category_users#current_user.spend_categories#.joins(:users).where(user_id: current_user.id)
    @summ_amount = current_user.spend_category_users.sum(:amount)
  end

  def create
    user = current_user
    user_categories_amount = user.spend_category_users.sum(:amount)
    @category = SpendCategory.new(category_params)
    @user_categories = current_user.spend_category_users
    if user_categories_amount < 100
      if @category.save
        user_category = user.spend_category_users.create(spend_category: @category)
        user_category.amount = category_params[:default_amount]
        user_category.save
        redirect_to spend_categories_path
      else
        render 'index'
      end
    else
      @category.errors[:base] << 'Your scale of  money distribution is 100%. To create a new category, delete on of currently existing or decrease the current amount.'
      render 'index'
    end
  end

  private
  def category_params
    params.require(:spend_category).permit(:name, :description, :default_amount)
  end
end
