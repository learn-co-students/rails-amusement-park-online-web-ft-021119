class RidesController < ApplicationController
   def create
      check_login
      @attraction = Attraction.find_by(id: params[:attraction_id])
      @user = User.find_by(id: session[:user_id])
      new_ride = Ride.new(user: @user, attraction: @attraction)
      if new_ride.valid?
         flash[:alert] = new_ride.take_ride
         new_ride.save
         redirect_to user_path(@user)
      else
         redirect_to attraction_path(@attraction)
      end
   end
end