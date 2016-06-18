puts("What is the hamster's name?")
name = gets.chomp
puts "What is the hamster's squeak volume level? (from 1 to 10)"
volume = gets.chomp.to_i
puts "What color fur does the hamster have?"
fur_color = gets.chomp
puts "Is the hamster a good candidate for adoption? (Y/N)"
adoptable = gets.chomp
if adoptable == "Y" || adoptable == "N"
	if adoptable == "Y"
		adoptable = true
	else
		adoptable = false
	end
else
	adoptable = nil
end
puts "What is the hamster's age?  Estimate if you and he/she are unclear."
age = gets.chomp.to_i

puts "Name: #{name}"
puts "Age: #{age}"
puts "Fur Color: #{fur_color}"
puts "Volume: #{volume}"
puts "Adoptable: #{adoptable}"
