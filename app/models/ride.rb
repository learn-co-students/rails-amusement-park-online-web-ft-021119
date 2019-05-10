class Ride < ApplicationRecord
   belongs_to :user
   belongs_to :attraction

   def low_ticket?
      user.tickets < attraction.tickets
   end

   def too_short?
      height_measure = user.height < attraction.min_height
   end

   # def take_ride

   #    @ticket_msg = "You do not have enough tickets to ride the #{attraction.name}."
   #    @height_msg = "You are not tall enough to ride the #{attraction.name}."

   #    if low_ticket? && too_short?
   #       flash[:alert] = "Sorry. " + @ticket_msg + " " + @height_msg
   #    elsif low_ticket?
   #       flash[:alert] = "Sorry. " + @ticket_msg
   #    elsif too_short?
   #       flash[:alert] = "Sorry. " + @height_msg
   #    else
   #       user.tickets -= attraction.tickets
   #       user.nausea  += attraction.nausea_rating
   #       user.happiness += attraction.happiness_rating
   #       user.save
   #    end
   # end

      def take_ride
      @message = nil
      @ticket_msg = "You do not have enough tickets to ride the #{attraction.name}."
      @height_msg = "You are not tall enough to ride the #{attraction.name}."

      if low_ticket? && too_short?
         @message = "Sorry. " + @ticket_msg + " " + @height_msg
      elsif low_ticket?
         @message = "Sorry. " + @ticket_msg
      elsif too_short?
         @message = "Sorry. " + @height_msg
      else
         user.tickets -= attraction.tickets
         user.nausea  += attraction.nausea_rating
         user.happiness += attraction.happiness_rating
         user.save
         @message = "Thanks for riding the #{attraction.name}!" 
      end
   end

end
