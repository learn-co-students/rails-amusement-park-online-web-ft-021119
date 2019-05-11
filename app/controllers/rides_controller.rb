class RidesController < ApplicationController
  before_action :current_user

  def index
  end

  def create
    #binding.pry
    @ride = Ride.create(attraction_id: params[:ride][:attraction_id])
    @ride.user_id = current_user.id
    redirect_to user_path(@user)
  end


end
