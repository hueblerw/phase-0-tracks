# require the gem

require 'sqlite3'

# OK, what's the plan?

# Then we need a user interface that will allow us to print the data and interact with the data.
# Requires a print data method.
# One for HO trains

def pretty_print_HO(db)
	puts "HO TRAINS"
	puts ""
	create_table_string = <<-SQL
  		SELECT HO_trains.description, HO_trains.engine_number, HO_trains.quantity, 
  			manufacturers.name, HO_trains.DCC, sound_system.name, HO_trains.price_when_new, 
  			HO_trains.include_sound_traxx
		FROM HO_trains
		JOIN manufacturers
		ON HO_trains.manufacturer_id = manufacturers.id
		JOIN sound_system
		ON HO_trains.sound_system_id = sound_system.id;
	SQL
	ho_trains = db.execute(create_table_string)
	puts("Description" + "\t\t" + "| Eng #" + "\t" + "| Quant" + "\t" + "| Manufacturer" + "\t\t" + "| DCC" + "\t" + "| Sound" + "\t\t" + "| Price" + "\t" + "| Include Traxx?")
	puts ""
	ho_trains.each do |train|
		i = 0
		begin
			if (i == 0)
				print train[i].to_s + "\t"
			else
				print "| " + train[i].to_s + "\t"
			end
			if (i == 5 && train[i].to_s.length < 6)
				print "\t"
			elsif (i == 3 && train[i].to_s.length < 6)
				print "\t\t"
			elsif (i == 3 && train[i].to_s.length < 14)
				print "\t"
			elsif (i == 0 && train[i].to_s.length < 8)
				print "\t\t"
			elsif (i == 0 && train[i].to_s.length < 16)
				print "\t"
			end
			i += 1
		end until i == 8
		print "\n"
	end
	puts ""
	puts "-----------------------------------------------------------------------------------------------"
	puts ""
end

# One for G-scale trains

def pretty_print_G_scale(db)
	puts "G Scale TRAINS"
	puts ""
	create_table_string = <<-SQL
  		SELECT G_scale_trains.description, G_scale_trains.engine_number, G_scale_trains.quantity, 
  			manufacturers.name, G_scale_trains.DCC, sound_system.name, G_scale_trains.price_when_new, 
  			G_scale_trains.include_sound_traxx
		FROM G_scale_trains
		JOIN manufacturers
		ON G_scale_trains.manufacturer_id = manufacturers.id
		JOIN sound_system
		ON G_scale_trains.sound_system_id = sound_system.id;
	SQL
	g_scale = db.execute(create_table_string)
	puts("Description" + "\t\t" + "| Eng #" + "\t" + "| Quant" + "\t" + "| Manufacturer" + "\t\t" + "| DCC" + "\t" + "| Sound" + "\t\t" + "| Price" + "\t" + "| Include Traxx?")
	puts ""
	g_scale.each do |train|
		i = 0
		begin
			if (i == 0)
				print train[i].to_s + "\t"
			elsif (i == 5 && train[i].to_s.length >= 14)
				print "| " + train[i].to_s[0 .. 10] + "..."
			else
				print "| " + train[i].to_s + "\t"
			end
			if (i == 5 && train[i].to_s.length < 6)
				print "\t"
			elsif (i == 3 && train[i].to_s.length < 6)
				print "\t\t"
			elsif (i == 3 && train[i].to_s.length < 14)
				print "\t"
			elsif (i == 0 && train[i].to_s.length < 8)
				print "\t\t"
			elsif (i == 0 && train[i].to_s.length < 16)
				print "\t"
			end
			i += 1
		end until i == 8
		print "\n"
	end
	puts ""
	puts "-----------------------------------------------------------------------------------------------"
	puts ""
end

# Requires a generic add train method for either database.

def add_train(db, train_type, description, num, quant, manufacturer, dcc, sound_system, price, traxx)
	create_table_string = "INSERT INTO #{train_type}(description, engine_number, quantity, manufacturer_id, DCC, sound_system_id, price_when_new, include_sound_traxx)"
	create_table_string += " VALUES (#{description}, #{num}, #{quant}, #{manufacturer}, #{dcc}, #{sound_system}, #{price}, #{traxx});"
	# INSERT INTO HO_trains(stars, comment, buisness_id, user_id) VALUES (5, "Good Food!", 1, 1);
	# p create_table_string
	db.execute(create_table_string)
end

# Requires a generic remove a train mehtod for either database.

def remove_train(db, train_type, column, value)
	create_table_string = "DELETE FROM #{train_type} "
	create_table_string += "WHERE #{train_type}.#{column} = " + '"' + "#{value}" + '";'
	p create_table_string
	db.execute(create_table_string)
end

# Requires a view only with value Y in column X method.
def view_only_Y_in_X(db, train_type, search_for, search_in)
	puts "#{train_type} TRAINS: with only #{search_for} in #{search_in}"
	puts ""
	if (train_type == "G")
		create_table_string = <<-SQL
  			SELECT G_scale_trains.description, G_scale_trains.engine_number, G_scale_trains.quantity, 
  					manufacturers.name, G_scale_trains.DCC, sound_system.name, G_scale_trains.price_when_new, 
  					G_scale_trains.include_sound_traxx
			FROM G_scale_trains
			JOIN manufacturers
			ON G_scale_trains.manufacturer_id = manufacturers.id
			JOIN sound_system
			ON G_scale_trains.sound_system_id = sound_system.id
			WHERE HO_trains.
		SQL
		create_table_string	+= "#{search_in} = " + "\"#{search_for}\";"	
	else
		create_table_string = <<-SQL
  			SELECT HO_trains.description, HO_trains.engine_number, HO_trains.quantity, 
  					manufacturers.name, HO_trains.DCC, sound_system.name, HO_trains.price_when_new, 
  					HO_trains.include_sound_traxx
			FROM HO_trains
			JOIN manufacturers
			ON HO_trains.manufacturer_id = manufacturers.id
			JOIN sound_system
			ON HO_trains.sound_system_id = sound_system.id
			WHERE HO_trains.
		SQL
		create_table_string	+= "#{search_in} = " + "\"#{search_for}\";"	
		p create_table_string
	end
	ho_trains = db.execute(create_table_string)
	puts("Description" + "\t\t" + "| Eng #" + "\t" + "| Quant" + "\t" + "| Manufacturer" + "\t\t" + "| DCC" + "\t" + "| Sound" + "\t\t" + "| Price" + "\t" + "| Include Traxx?")
	puts ""
	ho_trains.each do |train|
		i = 0
		begin
			if (i == 0)
				print train[i].to_s + "\t"
			else
				print "| " + train[i].to_s + "\t"
			end
			if (i == 5 && train[i].to_s.length < 6)
				print "\t"
			elsif (i == 3 && train[i].to_s.length < 6)
				print "\t\t"
			elsif (i == 3 && train[i].to_s.length < 14)
				print "\t"
			elsif (i == 0 && train[i].to_s.length < 8)
				print "\t\t"
			elsif (i == 0 && train[i].to_s.length < 16)
				print "\t"
			end
			i += 1
		end until i == 8
		print "\n"
	end
	puts ""
	puts "-----------------------------------------------------------------------------------------------"
	puts ""
end

#########################################################################

# Methods for interface

def printMenu
	puts "1. View all trains"
	puts "2. View HO trains"
	puts "3. View G_Scale trains"
	puts "4. Add a new HO train"
	puts "5. Add a new G_Scale train"
	puts "6. Remove a HO train"
	puts "7. Remove a G_Scale train"
	puts "8. Quit"
end


def printChart(db, chart)
	puts ""
	puts "Refer to chart below:"
	if (chart == "manufacturer_id")
		create_table_string = <<-SQL
			SELECT * FROM manufacturers;
		SQL
		manu = db.execute(create_table_string)
		manu.each do |name|
			puts name[0].to_s + "\t| " + name[1]
		end
	else
		create_table_string = <<-SQL
			SELECT * FROM sound_system;
		SQL
		sound = db.execute(create_table_string)
		sound.each do |name|
			puts name[0].to_s + "\t| " + name[1]
		end
	end
end


def createNewTrain(db, train_type)
	puts "Creating a new #{train_type} train!"
	request = ["description", "engine_number", "quantity", "manufacturer_id", "dcc", "sound_system_id", "price_when_new", "include_sound_traxx"]
	dataloop = []
	request.each do |parameter|
		puts ""
		print "Please enter #{parameter}:"
		if (parameter == "dcc" || parameter == "include_sound_traxx")
			print " (either y or n)"
		end
		print "\n"
		if (parameter == "manufacturer_id" || parameter == "sound_system_id")
			printChart(db, parameter)
		end
		puts "Press c or C at anytime to cancel."
		if (parameter == "dcc" || parameter == "include_sound_traxx" || parameter == "description")
			incoming = gets.chomp
		else
			incoming = gets.chomp.to_i
		end
		dataloop.push(incoming)
	end
	
	add_train(db, train_type, '"' + dataloop[0] + '"', dataloop[1], dataloop[2], dataloop[3], '"' + dataloop[4] + '"', dataloop[5], dataloop[6], '"' + dataloop[7] + '"')

	return dataloop

end


# Requires Driver Code:

# Create/Select the database
db = SQLite3::Database.new("trains.db")

# pretty_print_G_scale(db)

#add_train(db, train_type, description, num, quant, manufacturer, DCC, sound_system, price, traxx)
# name = "Will_Fake_Train"
#add_train(db, "HO_trains", '"' + name + '"' , 55, 1, 3, '"' + "y" + '"', 5, 450, '"' + "n" + '"')
# remove_train(db, "HO_trains", "description", name)

# pretty_print_HO	(db)

# view_only_Y_in_X(db, "HO", "y", "DCC")

puts "WELCOME TO THE TRAIN INVENTORY!!!"
puts "PLEASE CHOOSE WHAT TO DO"

done = false
incoming = -1

begin
	printMenu
	incoming = gets.chomp.to_i
	case incoming
		when 1
			pretty_print_HO(db)
			pretty_print_G_scale(db)
		when 2
			pretty_print_HO(db)
		when 3
			pretty_print_G_scale(db)
		when 4 
			# add a new train
			createNewTrain(db, "HO_trains")
			pretty_print_HO(db)
		when 5 
			# add a train
		when 6
			#remove a train
		when 7
			# remove a train
		when 8
			done = true
			puts "NOW QUITING!!!"
			puts "HAVE A NICE DAY!!!"
			puts "ALL INPUTS HAVE BEEN SAVED!!!"
		else
			puts ""
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			puts "Invalid input!  PLEASE TRY AGAIN!"
			puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			puts ""
	end
	puts ""
	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	puts ""
end until done