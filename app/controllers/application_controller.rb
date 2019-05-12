class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

   def require_login
     redirect_to root_path unless session.include? :user_id
   end

   def require_admin
     @user = User.find_by_id(session[:user_id])
     return head(:forbidden) unless @user.admin?
   end
end
