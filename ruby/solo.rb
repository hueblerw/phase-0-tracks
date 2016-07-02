class Tribe

	# create a tribe with name, clans with their own populations and a randomized set of cultural values and a total population.
	def initialize(name, clans)

		puts "Initializing Tribe #{name} ..."
		puts "----------"
		@name = name
		@clans = clans
		@culture = {
			"tradition" => (rand(200).to_f)/10.0,
			"violence" => (rand(200).to_f)/10.0,
			"work_ethic" => (rand(200).to_f)/10.0,
			"gender_equality" => ((rand(200).to_f)/10.0 - 10.0).round(1),
			"accepted_deviation" => (rand(200).to_f)/10.0
		}
		recalculate_pop
		@leader = ""

	end

	#setter and getter methods for each individual stat
	attr_accessor :leader, :name, :total_pop

	def change_pop (clan, change)
		@clans[clan] += change
		recalculate_pop
	end

	def change_culture(attribute, new_value)
		@culture[attribute] = new_value
	end

	# Returns the textual meaning for the cultural numbers from every cultural value.
	# Does this with a series of encased case statements.
	def cultural_meaning (culture, number)
		case culture
		when "tradition"
			case number
			when 0..5
				"Non-traditional"
			when 5..10
				"Respect for Tradition"
			when 10..15
				"Traditional"
			else
				"Very Traditional"
			end
		when "violence"
			case number
			when 0..5
				"Pacifist"
			when 5..10
				"Peaceful"
			when 10..15
				"War-like"
			else
				"Sadists"
			end
		when "work_ethic"
			case number
			when 0..5
				"Lazy"
			when 5..10
				"Careless"
			when 10..15
				"Diligent"
			else
				"Workaholics"
			end
		when "accepted_deviation"
			case number
			when 0..5
				"Conformist"
			when 5..10
				"Intolerant"
			when 10..15
				"Tolerant"
			else
				"Open Society"
			end
		when "Gender Equality"
			case number
			when -10..-4
				"Male-Dominated"
			when -4..-1
				"Male-Tilted"
			when -1..1
				"Gender Equality!!!"
			when 1..4
				"Female-Tilted"
			else
				"Female-Dominated"
			end
		end
	end

	# A method to recalculate the total population by looping through each clan in the @clans hash.
	# Needs to be called everytime a population change is entered.
	def recalculate_pop()
		sum = 0
		@clans.each do |clan, people|
			sum += people
		end
		@total_pop = sum
	end

	# Methods for calculating Work Hours tribe can do and fighting strength and murder rate.
	def calc_work_hours()
		((@culture["work_ethic"]/20.0) * 8.0 + 8.0) * @total_pop
	end

	def calc_fighting_strength()
		(@culture["violence"] * @total_pop) / 5.0
	end

	def calc_murder_rate()
		@culture["violence"] / 2.0
	end

	# Print all the tribes info.
	def print_tribe_info()
		if @leader == ""
			lead = "no one"
		else
			lead = @leader
		end
		puts "The #{name} tribe lead by #{lead}:"
		puts "Clan Listings: "
		@clans.each do |clan, people|
			puts "#{clan} has #{people} members."
		end
		puts "----------"
		puts "Cultural Stats:"
		@culture.each do |culture, num|
			puts "#{culture}: #{num} // #{cultural_meaning(culture, num)}"
		end
		puts "----------"
		puts "Total Population: #{@total_pop}"
		puts "Work-Hours Available: #{calc_work_hours}"
		puts "Fighting Strength: #{calc_fighting_strength}"
		puts "Murder Rate: #{calc_murder_rate} %"
	end
			
	def print_clans()
		puts "Clan Listings: "
		@clans.each do |clan, people|
			puts "#{clan} has #{people} members."
		end
	end

end

# User interface:
# Should ask if you wish to create a tribe to start with.
# Show the currently selected tribe.
# Then present a menu of options: new tribe, change current tribes: leader, clans, culture, name, exit.

tribes = {}
next_tribe = true
done = false

begin

	if next_tribe
		clans = {}
		puts "Please enter the name of your tribe:"
		name = gets.chomp
		puts "How many clans would you like to add?"
		num_of_clans = gets.chomp.to_i
		num_of_clans.times do
			puts "Please enter clan name: "
			clan_temp = gets.chomp
			puts "Please enter the number of people in this clan:"
			clans[clan_temp] = gets.chomp.to_i
		end
		# When done gathering the info on the tribe initialize the new tribe and print it.
		tribes[name] = Tribe.new(name, clans)
		puts "Would you like to give this tribe a leader? (y/n)"
		if gets.chomp.downcase == "y"
			puts "Please enter you leader's name: "
			tribes[name].leader = gets.chomp
		end
		tribes[name].print_tribe_info
		next_tribe = false
	end

	# Now display the menu for your next choice.
	puts "----------"
	puts "~~~~~~~~~~"
	puts "----------"
	puts "Current Tribe: #{name}"
	puts "1. Create a new Tribe"
	puts "2. Select a different Tribe"
	puts "3. Change current tribe's leader"
	puts "4. Change the population of a clan in this tribe"
	puts "5. Change the culture of a clan in this tribe"
	puts "6. No more changes to make."
	puts "Enter the number of your next choice:"
	incoming = gets.chomp.to_i
	puts "----------"
	case incoming
		when 2
			puts "Available Tribes: "
			tribes.each do |name, tribe|
				puts "#{name}"
			end
			puts "What tribe would you like to select?"
			name = gets.chomp
		when 3
			puts "Please enter new leader name: "
			tribes[name].leader = gets.chomp
		when 4
			tribes[name].print_clans
			puts "Please enter the name of the clan whose population you'd like to change: "
			new_name = gets.chomp
			puts "Please enter how much you'd like to increase or decrease the population by: "
			tribes[name].change_pop(new_name, gets.chomp.to_i)
		when 5
			puts "Please enter cultural aspect you'd like to change (tradition, violence, work_ethic, gender_equality, accepted_deviation): "
			cult = gets.chomp
			puts "Please enter the new value you'd like to change it to (from 0-20):"
			tribes[name].change_culture(cult, gets.chomp.to_f)
		when 6
			done = true
		else
			next_tribe = true
	end
	if incoming != 1
		tribes[name].print_tribe_info
	end

end until done