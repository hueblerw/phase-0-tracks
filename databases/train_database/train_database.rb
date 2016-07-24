# require the gem

require 'sqlite3'

# OK, what's the plan?
# We need a block of code that will only run to initialize the data from file.  Somehow . . .
def initialize_the_tables(db)
	# Create the tables
	create_table_string = <<-SQL
  		CREATE TABLE IF NOT EXISTS ho_trains(
    		id INTEGER PRIMARY KEY, description VARCHAR(1024), engine_num INTEGER, quantity INTEGER,
    		manufacturer_id INTEGER, DCC_id INTEGER, sound_system_id INTEGER, price_when_new INTEGER,
    		include_$100_for_Sound_Traxx VARCHAR(255)
  		)
		SQL
	db.execute(create_table_string)
	create_table_string = <<-SQL
  		CREATE TABLE IF NOT EXISTS g_scale_trains(
    		id INTEGER PRIMARY KEY, description VARCHAR(1024), engine_num INTEGER, quantity INTEGER,
    		manufacturer_id INTEGER, DCC_id INTEGER, sound_system_id INTEGER, price_when_new INTEGER,
    		include_$100_for_Sound_Traxx VARCHAR(255)
  		)
		SQL
	db.execute(create_table_string)
	create_table_string = <<-SQL
  		CREATE TABLE IF NOT EXISTS manufacturers(
    		id INTEGER PRIMARY KEY, name VARCHAR(255)
  		)
		SQL
	db.execute(create_table_string)
	create_table_string = <<-SQL
  		CREATE TABLE IF NOT EXISTS DCC(
    		id INTEGER PRIMARY KEY, yes_no CHAR(1)
  		)
		SQL
	db.execute(create_table_string)
	create_table_string = <<-SQL
  		CREATE TABLE IF NOT EXISTS sound_system(
    		id INTEGER PRIMARY KEY, name VARCHAR(255)
  		)
		SQL
	db.execute(create_table_string)
	# Enter the data.
end

def destroy_the_tables(db)

end

########################################################################

# Then we need a user interface that will allow us to print the data and interact with the data.
# Requires a print data method.
# One for HO trains


def print_HO(db)
	ho_trains = db.execute("SELECT * FROM ho_trains")
	ho_trains.each do |train|
		puts "#{train[0]} is #{kitten['age']}"
	end
end
# end

# One for G-scale trains

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

# If necessary re-initialize the database.
start_fresh = true
if (start_fresh)
	File.delete("trains.db")
	db = SQLite3::Database.new("trains.db")
	initialize_the_tables(db)
end