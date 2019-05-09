module UsersHelper
   def mood(user)
      user.nausea > user.happiness ? "sad" : "happy"
   end
end
