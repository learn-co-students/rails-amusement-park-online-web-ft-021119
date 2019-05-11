class UsersController < ApplicationController
  before_action :require_login, :current_user, only: [:show, :take_ride, :enough_tickets?, :tall_enough?]


  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/', alert: "Please try again."
    end
  end

  def show
  end




  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end



end
