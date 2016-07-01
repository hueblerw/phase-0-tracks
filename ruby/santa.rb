class Santa

	def speak()
  		puts "Ho, ho, ho! Haaaappy holidays!" 
  	end

  	def eat_milk_and_cookies(cookie)
  		puts "That was a good #{cookie}!" 
  	end

  	def get_gender()
  		return @gender
  	end

  	def celebrate_birthday()
  		@age += 1
  	end

  	def get_mad_at(reindeer)
  		# find the offending reindeer in the array. 
  		n = 0
  		num = @reindeer_ranking.length + 1
  		begin
  			if @reindeer_ranking[n] == reindeer
  				num = n
  				p "#{n} / #{num}"
  			else
  				n += 1
  				p "#{n} #{@reindeer_ranking[n]}"
  			end 
  		end until n >= @reindeer_ranking.length + 1 || num != @reindeer_ranking.length + 1

  		# Promote every reindeer from that point onwards.
  		if num == @reindeer_ranking.length + 1
  			puts "Error: No such reindeer exists!!!"
  		else
  			for k in num .. @reindeer_ranking.length - 1
  				@reindeer_ranking[k] = @reindeer_ranking[k+1]
  			end
  			# Place the offending reindeer in the last slot.
  			@reindeer_ranking[@reindeer_ranking.length-1] = reindeer
  			p @reindeer_ranking
  		end
  		
  	end

  	def initialize(gender, ethnicity)
  		puts "Initializing Santa instance ..."
  		@gender = gender
  		@ethnicity = ethnicity
  		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
  		@age = 0
  	end

end

# Mr_Santa = Santa.new
# Mr_Santa.speak
# Mr_Santa.eat_milk_and_cookies("peanut butter cookie")

santas = []
santas << Santa.new("agender", "black")
santas << Santa.new("female", "Latino")
santas << Santa.new("bigender", "white")
santas << Santa.new("male", "Japanese")
santas << Santa.new("female", "prefer not to say")
santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
santas << Santa.new("N/A", "N/A")

santas[0].get_mad_at("Vixen")