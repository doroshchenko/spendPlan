include Monban::ControllerHelpers

class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception

  def hello
    if current_user
      @user = current_user.email
    else
      redirect_to :controller => 'sessions', :action => 'new'
    # test push after ssh key added
    end
  end

  def logout
    reset_session
  end
end
