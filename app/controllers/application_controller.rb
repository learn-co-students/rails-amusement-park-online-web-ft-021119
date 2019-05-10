class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user

  def home
  end

  private

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate_user
    if !logged_in? 
      redirect_to root_path
    end
  end
end
