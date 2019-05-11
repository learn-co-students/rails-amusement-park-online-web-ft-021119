class RidesController < ApplicationController
  #skip_before_action :verify_authenticity_token
  before_action :current_user

  def index
  end

  def create
    @ride = Ride.create(attraction_id: params[:ride][:attraction_id], user_id: params[:ride][:user_id])

    if @ride
      response = @ride.take_ride
      flash[:notice] = response
      redirect_to user_path(@ride.user)
    else
      redirect to attraction_path(@ride.attraction)
    end
  end


end
