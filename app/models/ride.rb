class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = User.find_by_id(self.user_id)
    @attraction = Attraction.find_by_id(self.attraction_id)
    if @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif @user.height < @attraction.min_height
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    elsif @user.tickets < @attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      @user.tickets -= @attraction.tickets
      @user.happiness += @attraction.happiness_rating
      @user.nausea += @attraction.nausea_rating
      @user.save
      "Thanks for riding the #{@attraction.name}!"
    end
  end

end
