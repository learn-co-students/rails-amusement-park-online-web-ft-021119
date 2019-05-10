class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def home
    render 'welcome/home'
  end

  def current_user
    @user = User.find_by(id: session[:user_id]) if logged_in?
  end

  helper_method :logged_in?, :check_login
    def logged_in?
      !!session[:user_id]
    end

    def check_login
      redirect_to root_path if !(logged_in?)
    end
end
