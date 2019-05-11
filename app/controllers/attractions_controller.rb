class AttractionsController < ApplicationController
  before_action :require_login, :current_user, only: [:show]

  def index
  end

  def show
    #binding.pry
    @user = User.find_by_id(session[:user_id])
    @attraction = Attraction.find_by_id(params[:id])
    @ride = Ride.new

  end


end
