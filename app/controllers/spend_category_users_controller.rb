class SpendCategoryUsersController < ApplicationController
  def update
    update_amount = params[:spend_category_user][:amount].to_i
    @spend_category_user = SpendCategoryUser.find(params[:spend_category_user][:id])

    user_categories_amount = current_user.spend_category_users.sum(:amount)
    rest_amount = user_categories_amount - @spend_category_user.amount.to_i
    if rest_amount + update_amount <= 110
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
