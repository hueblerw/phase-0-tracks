# Method to create a list
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

# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # [fill in any steps here]
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]

# Method to add an item to a list
# input: item name and optional quantity
# steps:
# output:

# Method to remove an item from the list
# input:
# steps:
# output:

# Method to update the quantity of an item
# input:
# steps:
# output:

# Method to print a list and make it look pretty
# input:
# steps:
# output: