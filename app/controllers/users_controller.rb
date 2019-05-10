
class UsersController < ApplicationController
  #before_action :authenticate_user, only: [:show]

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id #so user doesnt have to login
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end
end
