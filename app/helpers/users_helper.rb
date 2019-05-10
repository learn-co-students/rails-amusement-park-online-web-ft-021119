module UsersHelper

  def mood(user)
    unless user.admin
      if user.nausea && user.happiness
        user.nausea > user.happiness ? "sad" : "happy"
      end
    end
  end
end
