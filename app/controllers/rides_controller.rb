class RidesController < ApplicationController
  def create
    @user = User.find_by(id: session[:user_id])
    @attraction = Attraction.find_by(id: params[:attraction_id])

    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id )

    if @ride.save
      @notice = @ride.take_ride
      redirect_to user_path(@user), notice: @notice
      #flash[:notice] did not work because it wasn't on same line, buried in controller instead of view
    else
      redirect_to attraction_path(@attraction)
    end
  end
end
