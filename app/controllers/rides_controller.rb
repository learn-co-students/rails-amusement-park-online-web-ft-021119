class RidesController < ApplicationController
  def create
    @user = User.find_by(id: session[:user_id])
    @attraction = Attraction.find_by(id: params[:attraction_id])

    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id )
    if @ride.save
      flash[:alert] = @ride.take_ride
      redirect_to user_path(@user)

      # @message = @ride.take_ride
      # redirect_to user_path(@ride.user, :message => @message)
    else
      redirect_to attraction_path(@attraction)
    end
  end
end
