# First break the name string I am given into an array of two names.
done = false

agent_names = {

}

begin
	puts "Please enter the agents name: "
	name = gets.chomp
	# Lower case them.
	name.downcase!
	if name == "quit"
		done = true
	else

	names = name.split(' ')

	# Then flip the order of the two names.
	names.reverse!
	# p names

	# Then break each name into letters
	firstletters = names[0].split('')
	secondletters = names[1].split('')
	# p firstletters
	# p secondletters

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
	list_of_vowels = "aeiou"

	for n in 0 ... firstletters.length
		if list_of_vowels.index(firstletters[n]) == nil
			firstletters[n] = nextconsonant(firstletters[n])
			# p firstletters[n]
		else
			firstletters[n] = nextvowel(firstletters[n])
			# p firstletters[n]
		end
		# Recapitualize if it is the first letter.
		if n == 0
			firstletters[n].upcase!
		end
	end

	for n in 0 ... secondletters.length
		if list_of_vowels.index(secondletters[n]) == nil
			secondletters[n] = nextconsonant(secondletters[n])
			# p firstletters[n]
		else
			secondletters[n] = nextvowel(secondletters[n])
			# p firstletters[n]
		end
		# Recapitualize if it is the first letter.
		if n == 0
			secondletters[n].upcase!
		end
	end

	# p "#{firstletters} // #{secondletters}"

	alias_name = firstletters.join('') + " " + secondletters.join('')

	puts "Here is the alias for the agent: "
	puts alias_name

	agent_names["#{name}" => "#{alias_name}"]

end

end until done

puts "Here is the database of alias names.  Make sure the bad guys can't see your screen as this is TOP SECRET!"
puts agent_names