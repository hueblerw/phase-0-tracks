# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

puts "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

puts "zom".insert(1, "o")
# => “zoom”

puts "enhance".ljust(11).rjust(15)
# => "    enhance    "

puts "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

puts "the usual"+" suspects"
#=> "the usual suspects"
puts "Note: you did say that + is a method so . . ."

puts " suspects".prepend "the usual"
# => "the usual suspects"

puts "The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"

puts "The mystery of the missing first letter"[1..-1]
# => "he mystery of the missing first letter"

puts "Elementary,    my   dear        Watson!".squeeze(" ")
# => "Elementary, my dear Watson!"

puts "z".ord
# => 122 
puts "(What is the significance of the number 122 in relation to the character z?)"
puts "It is the ASCII character number.  That is the unique number given to this character in the ASCII format."

puts "How many times does the letter 'a' appear in this string?".count('a')
# => 4