class UserIncomeController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  def index
    @incomes = UserIncome.where(user_id: current_user.id).by_month_year(session[:current_month], session[:current_year])
  end

  def create
    if request.request_parameters[:user_income]
      amount = request.request_parameters[:user_income][:amount]

      income = UserIncome.new
      income.user = User.find_by(email: current_user.email)
      income.amount = amount
      income.save()

      #redirect_to :controller => 'application', :action => 'hello'
      redirect_to user_income_index_path
    end

  end

  def new
  end

  def destroy
    @income = UserIncome.find(params[:id])
    @income.destroy
    redirect_to user_income_index_path
  end

  def show
  end
end
