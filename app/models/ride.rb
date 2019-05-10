class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :ride
  validates :user_id, presence: true
  validates :attraction_id, presence: true

  def take_ride
    if enough_tickets? && tall_enough?
      user.tickets = user.tickets - ride.tickets
      user.nausea = user.nausea + ride.nausea
      user.happiness = user.happiness + ride.happiness
    else
      # alert: "You may not take this ride"
      redirect_to '/attractions/index'
    end
  end


    private

    def enough_tickets?
      if user && ride
        user.tickets > ride.tickets ? true : false
      end
    end

    def tall_enough?
      if user && ride
        user.height > ride.height ? true : false
      end
    end


end
