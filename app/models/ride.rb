class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.tickets < attraction.tickets && user.height < attraction.min_height
        "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
    if user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end
    if user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
    if
      new_tickets = user.tickets - attraction.tickets
      user.update(tickets: new_tickets)

      new_nausea = user.nausea + attraction.nausea_rating
      user.update(nausea: new_nausea)

      new_happiness = user.happiness + attraction.happiness_rating
      user.update(happiness: new_happiness)
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
