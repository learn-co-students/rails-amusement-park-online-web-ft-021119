class RidesController < ApplicationController
  before_action :current_user

  def index
  end

  def create
    @user = current_user
    @attraction = Attraction.find_by_id(params[:attraction_id])
    @ride = Ride.new(@attraction, @user)
    if @ride.valid?
      redirect_to user_path(@user)
    end

  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end
end
