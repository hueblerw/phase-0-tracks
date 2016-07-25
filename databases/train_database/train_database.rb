# require the gem

require 'sqlite3'

# OK, what's the plan?

# Then we need a user interface that will allow us to print the data and interact with the data.
# Requires a print data method.
# One for HO trains

def pretty_print_HO(db)
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

# Requires a generic remove a train mehtod for either database.

# Possibly a swap lines method for any two line on a table.

# Requires a sort by column X method

# Requires a view only with value Y in column X method.

# Requires a net value method for both tables and the combined tables.

#########################################################################

# Requires Driver Code:

# Create/Select the database
db = SQLite3::Database.new("trains.db")

pretty_print_G_scale(db)
pretty_print_HO	(db)