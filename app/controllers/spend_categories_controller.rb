class SpendCategoriesController < ApplicationController
  def index
    @categories = current_user.spend_category_users#current_user.spend_categories#.joins(:users).where(user_id: current_user.id)
  end

  def create
=begin
    @category = SpendCategory.new(category_params)
    if @category.save
      @category.users.create(email: 'ddd', password_digest: 'sdfsdfsdfsdfsdfsdf')
    end
=end
    cat = SpendCategory.create(name: 'dd', description: 'ddd')
    user = current_user
    user.spend_categories.create(name: 'd', description: 'd')
    #User.create(email: 'd3dd', password_digest: '33333333333')
    redirect_to spend_categories_path
  end

  private
  def category_params
    params.require(:spend_category).permit(:name, :description)
  end
end
