# the client's name, age, number of children, decor theme, 
# and so on (you can choose your own as long as it's a good mix of string, integer, and boolean data).

# Initialize the hash

design = {
	name: "",
	age: "",
	num_childs: "",
	decor_theme: "",
	num_couches: "",
	rug_color: "",
	extra_windows: "",
	pattern: ""
}

# Ask the user for the inputs one by one.

puts "Begin inputting the client's information:"
puts "Name: "
design[:name] = gets.chomp

puts "Age: "
design[:age] = (gets.chomp).to_i

puts "Number of Children: "
design[:num_childs] = (gets.chomp).to_i

puts "Decor Theme: "
design[:decor_theme] = gets.chomp

puts "Number of Couches: "
design[:num_couches] = (gets.chomp).to_i

puts "Number of Extra Windows: "
design[:extra_windows] = (gets.chomp).to_i

puts "Pattern type for fabrics: "
design[:pattern] = gets.chomp

# Output the data.

puts design

# Allow the user the chance to make a single fix.
# Ask what if anything they want to change.  If they want change send them to a case statement.
# Normally, I'd make this more elegant, but I've been sick all week and can barely see the screen today so I'm just trying to get this done.
# Sorry about that.  I'll come back and look later when I feel better.

puts "Now is you chance to fix any mistakes."
puts "If you would like to fix a piece of data please enter the appropriate one now, otherwise please enter 'none':"
incoming = gets.chomp
if incoming != "none"
	puts "please enter new value for #{incoming}:"
	case incoming
	when "name"
		design[:name] = gets.chomp
	when "age"
		design[:age] = (gets.chomp).to_i
	when "num_childs"
		design[:num_childs] = (gets.chomp).to_i
	when "decor_theme"
		design[:decor_theme] = gets.chomp
	when "num_couches"
		design[:num_couches] = (gets.chomp).to_i
	when "extra_windows"
		design[:extra_windows] = (gets.chomp).to_i
	when "pattern"
		design[:pattern] = gets.chomp
	else 
		puts "Variable not found!"
	end
else
	puts "No changes made!"
end

# Output the finished hash.

puts design