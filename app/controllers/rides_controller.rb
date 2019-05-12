class RidesController < ApplicationController
  before_action :require_login
  
  def new
  end

  def create
    @user = User.find_by_id(params[:ride][:user_id])
    @attraction = Attraction.find_by_id(params[:ride][:attraction_id])
    @ride = Ride.new(ride_params)
    if !@user.nil? && !@attraction.nil? && !@ride.nil?
      message = @ride.take_ride
      flash[:notice] = message
      redirect_to user_path(@user)
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
