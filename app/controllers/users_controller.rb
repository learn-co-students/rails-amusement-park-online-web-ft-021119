class UsersController < ApplicationController
   def new
      @user = User.new
   end

   def create
      @user = User.new(user_params)
      if @user.save
         session[:user_id] = @user.id
         redirect_to user_path(@user)
      else
         render :new, alert: "Invalid input"
      end
   end

   def show
      check_login
      @user = User.find_by_id(params[:id])  
   end


   private
      def user_params
         params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
      end
end