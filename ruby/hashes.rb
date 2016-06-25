# the client's name, age, number of children, decor theme, 
# and so on (you can choose your own as long as it's a good mix of string, integer, and boolean data).

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

puts "Begin inputting the client's information:"
puts "Name: "
design[:name] = gets.chomp

puts "Age: "
design[:age] gets.chomp.to_i

puts "Number of Children: "
design[:num_childs] gets.chomp.to_i

puts "Decor Theme: "
design[:decor_theme] gets.chomp

puts "Number of Couches: "
design[:num_couches] gets.chomp.to_i

puts "Number of Extra Windows: "
design[:extra_windows] gets.chomp.to_i

puts "Pattern type for fabrics: "
design[:pattern] gets.chomp

puts design
