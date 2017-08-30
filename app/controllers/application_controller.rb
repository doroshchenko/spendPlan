include Monban::ControllerHelpers

class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception

  def hello
    if current_user
      @user = current_user.email
      @current_month = session[:current_month].present? ? session[:current_month].to_i : Date.today.month.to_i
      @current_year  = session[:current_year].present? ? session[:current_year].to_i : Date.today.year.to_i
      # set session time
      session[:current_month] = @current_month
      session[:current_year]  = @current_year

      @income_amount = UserIncome.where(user_id: current_user.id).by_month_year(@current_month, @current_year).sum(:amount)
      @spent_amount  = SpendEntry.where(user_id: current_user.id).by_month_year(@current_month, @current_year).sum(:amount)

      @balance = @income_amount.to_f - @spent_amount.to_f

      @distributed = current_user.spend_category_users.sum(:amount).to_i
      @spend_categories = current_user.spend_category_users
    else
      redirect_to :controller => 'sessions', :action => 'new'
    end
  end

  def set_spend_month
    session[:current_month] = params[:month]
    session[:current_year]  = params[:year]

    redirect_to root_path
  end

  def logout
    reset_session
    redirect_to root_path
  end
end
