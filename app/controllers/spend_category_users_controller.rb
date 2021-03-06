class SpendCategoryUsersController < ApplicationController

  def show
    @spend_entry = SpendEntry.new
    @spend_entries = current_user.spend_entries.where(spend_category_user_id: params[:id])
                         .by_month_year(session[:current_month], session[:current_year])
    @category = SpendCategoryUser.find(params[:id])
    income_to_spend   = SpendCategoryUser.amount_to_spend(params[:id], session[:current_month], session[:current_year])
    total_spent       = @spend_entries.sum(:amount)
    @spend_category_user_id = @category.id
    @current_balance = income_to_spend.to_f - total_spent.to_f
  end

  def update
    update_amount = params[:spend_category_user][:amount].to_i
    @spend_category_user = SpendCategoryUser.find(params[:spend_category_user][:id])
    user_categories_amount = current_user.spend_category_users.sum(:amount)
    rest_amount = user_categories_amount - @spend_category_user.amount.to_i
    if rest_amount + update_amount <= 100
      @spend_category_user.amount = update_amount
      if @spend_category_user.save
        redirect_to spend_categories_path
      end
    else
      flash[:error] = "Failed to update an amount!"
      redirect_to spend_categories_path

    end

  end

  def destroy
    @user_category = SpendCategoryUser.find(params[:id])
    if @user_category.destroy
      redirect_to spend_categories_path
    else
      # show error
    end
  end
end
