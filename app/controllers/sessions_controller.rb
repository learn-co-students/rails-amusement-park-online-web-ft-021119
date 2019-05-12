class SessionsController < ApplicationController
  def new
    if session[:user_id].present?
      @user = User.find_by_id(session[:user_id])
      redirect_to user_path(@user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(id: params[:user][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    if !session[:user_id].nil?
      reset_session
    end
    redirect_to root_path
  end

end
