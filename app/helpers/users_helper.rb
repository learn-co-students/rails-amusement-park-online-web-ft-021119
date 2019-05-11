module UsersHelper

  def mood
    unless self.admin
      if self.nausea && self.happiness
        #binding.pry
        self.nausea > self.happiness ? "sad" : "happy"
      end
    end
  end
end
