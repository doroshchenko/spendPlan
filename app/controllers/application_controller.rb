include Monban::ControllerHelpers

class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception

  def hello
    if current_user
      @user = current_user.email
      @incomes = UserIncome.where(user_id: current_user.id).sum(:amount)
      @distributed = current_user.spend_category_users.sum(:amount).to_i
    else
      redirect_to :controller => 'sessions', :action => 'new'
    # test push after ssh key added
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end
end
