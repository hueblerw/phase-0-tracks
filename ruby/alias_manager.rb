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

# p "#{nextvowel("a")}, #{nextvowel("e")}, #{nextvowel("i")}, #{nextvowel("o")}, #{nextvowel("u")}"

# Do likewise for the consonants.
def nextconsonant (consonant)
	out = ""
	list = "bcdfghjklmnpqrstvwxyz"
	if consonant == "z"
		out = "b"
	else
		out = list[list.index(consonant) + 1]
	end
	return out
end

# p "#{nextconsonant("b")}, #{nextconsonant("j")}, #{nextconsonant("q")}, #{nextconsonant("z")}"

# Now for each letter move to the next appropriate letter.

# Recapitalize to complete.