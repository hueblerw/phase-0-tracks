def create_a_list(incoming_string)
	groceries = incoming_string.split(" ")
	groceries_list = {}
	groceries.each do |item|
		groceries_list[item] = 1
	end
	groceries_list
end	

def add_an_item!(incoming, groceries_list)
	groceries_list[incoming] = 1
	groceries_list
end

def remove_item!(incoming, groceries_list)
	groceries_list.delete(incoming)
	groceries_list
end

def change_quantity!(item, number, groceries_list)
	groceries_list[item] = number
	groceries_list
end

def print_list(groceries_list)
	puts "Grocery List:"
	groceries_list.each do |item, number|
		puts "#{item}: #{number}"
	end
end

g_list = create_a_list("peas cheese tomatoes")
add_an_item!("corn", g_list)
remove_item!("corn", g_list)
change_quantity!("peas", 600, g_list)
print_list(g_list)

# REFLECTIONS:

# What did you learn about pseudocode from working on this challenge?

# The example they had gave a more detailed layout of the psuedocode than I usually do.  
# It's something I need to learn to be more patient with.
# Under the pressure of a gps I wanted to rush right in and get going.

# What are the tradeoffs of using arrays and hashes for this challenge?

# A hash allows you to name things more easily since you are assigning named items a number.
# An array would probably be simpler to initially enter but to find the items contained inside it will be much more difficult.

# What does a method return?
# An object.  So either arrays hashes or variables or states.

# What kind of things can you pass into methods as arguments?
# Other objects.  So either arrays hashes or variables or states.

# How can you pass information between methods?
# By passing it through the method input and passing the relevant information out the output

# What concepts were solidified in this challenge, and what concepts are still confusing?
# Hashes were my weakest coming in.  I feel this definitely helped me clear up some issues with hashes.
# I still need repetition with it.  
# I still know I am missing a huge amount of "convention" that is supposed to be followed with the code.
# I generally struggle to pick up conventions anyway and without having a live group of people to compare coding methods with makes that harder.