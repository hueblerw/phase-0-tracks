class Santa

	attr_reader :ethnicity
	attr_accessor :gender, :age

	def speak()
  		puts "Ho, ho, ho! Haaaappy holidays!" 
  	end

  	def eat_milk_and_cookies(cookie)
  		puts "That was a good #{cookie}!" 
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
  				# p "#{n} / #{num}"
  			else
  				n += 1
  				# p "#{n} #{@reindeer_ranking[n]}"
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
  			# p @reindeer_ranking
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
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "hermaphrodite", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A", "Mexican", "Undead Dark Lord"]

1200.times do
	santas << Santa.new(example_genders[rand(example_genders.length).to_i], example_ethnicities[rand(example_ethnicities.length).to_i])
end

santas.each do |i|
	i.age = rand(140)
	puts "Santa is #{i.age} years old!"
	puts "Santa is #{i.ethnicity}."
	puts "Santa now has a #{i.gender} gender."
end

puts "Total number of Santas: 1200"

santas[0].get_mad_at("Vixen")