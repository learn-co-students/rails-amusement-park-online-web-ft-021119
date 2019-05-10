class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction
  # validates :user_id, presence: true
  # validates :attraction_id, presence: true

  def take_ride(user,attraction)
    binding.pry
    # ride = Attraction.find_by_id(params[:attraction_id])
    if user && attraction
      if enough_tickets?(user, attraction) && tall_enough?(user, attraction)
        user.tickets = user.tickets - attraction.tickets
        user.nausea = user.nausea + attraction.nausea_rating
        user.happiness = user.happiness + attraction.happiness_rating
        redirect_to user_path(user)
      else
        # alert: "You may not take this attraction"
        redirect_to user_path(user)
      end
    end
  end


  def enough_tickets?(user, attraction)
    user.tickets > attraction.tickets ? true : false
  end

  def tall_enough?(user, attraction)
    user.height > attraction.min_height ? true : false
  end



end
