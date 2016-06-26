# First break the name string I am given into an array of two names.
puts "Please enter the agents name: "
name = gets.chomp
# Lower case them.
name.downcase

names = name.split(' ')

# Then flip the order of the two names.
names.reverse!
p names

# Then break each name into letters
firstletters = names[0].split('')
secondletters = names[1].split('')

# Method to advance a vowel to the next vowel in the vowel string.
def nextvowel (vowel)
	out = ""
	list = "aeiou"
	if vowel == "u"
		out = "a"
	else
		out = list[list.index(vowel) + 1]
	end
	return out
end

p "#{nextvowel("a")}, #{nextvowel("e")}, #{nextvowel("i")}, #{nextvowel("o")}, #{nextvowel("u")}"

otherlist = "bcdfghjklmnpqrstvwxyz"

# Do likewise for the consonants.

# Recapitalize to complete.