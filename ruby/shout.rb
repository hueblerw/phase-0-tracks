module Shout

	def yell_angrily(words)
    	words + "!!!" + " :("
  	end

  	def yelling_happily(words)
  		words.upcase + "!!!  :)"
  	end

end

# -----------------------

class Old_Guy

	include Shout

	def initialize(sex)
		@sex = sex
		@direction = "north"
		if sex == "male"
			@his_her = "his"
		else 
			if sex == "female"
				his_her = "her"
			else
				his_her = "its"
			end
		end
	end	

	def put_in_teeth()
		puts "*Staggers to sink and puts in #{@his_her} teeth.*"
	end

	def get_off_my_lawn(victims)
		puts self.yell_angrily("Get off my lawn you #{victims}")
	end

	def turn_lawn_chair(new_direction)
		@direction = new_direction
		puts "The lawn chair is now facing #{@direction}."
	end

end


class Young_Guy

	include Shout

	def initialize(sex, handle)
		@sex = sex
		@twitter_handle = handle
		if sex == "male"
			@men_women = "women"
		else 
			if sex == "female"
				@men_women = "men"
			else
				@men_women = "human beings"
			end
		end
	end

	def looking_for_love(state)
		if state == true
			puts self.yelling_happily("Where are all the #{@men_women}")
		else
			puts "I believe our subject is dead."
		end
	end

	def lost_internet_access()
		puts self.yell_angrily("I can't see pictures of cats")
	end

	def twitter_functions(tweet)
		puts "#{@twitter_handle}: #{tweet}"
		puts self.yelling_happily("The tweeting is done")
	end

end

# -----------------------

#words = "You bought a cat"

#p Shout.yell_angrily(words)
#p Shout.yelling_happily(words)

Dennis = Old_Guy.new("male")
Melissa = Young_Guy.new("female", "o-mel-g")

Melissa.looking_for_love(true)
Melissa.lost_internet_access
Dennis.put_in_teeth
Melissa.twitter_functions("Look at this cute old man")
Dennis.turn_lawn_chair("south")
Dennis.get_off_my_lawn("git of a girl")
Melissa.looking_for_love(false)