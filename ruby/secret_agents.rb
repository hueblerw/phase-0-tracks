# encrypt method
# ask the user for an input string
# then just increase the letter of the string one letter forward.
# The exception is "z" which should become "a" and the " " which should remain " ".

# decrypt method
# ask the user for an input string
# then just decrease the letter of the string one letter forward.
# The exception is "a" which should become "z" and the " " which should remain " ".

def encrypt(incoming)
	out = ""
	for i in 0 ... incoming.length
		if incoming[i] == "z"
			out = out + "a"
		elsif incoming[i] == " "
			out = out + " "
		else
			out = out + incoming[i].next
		end
	end
	return out
end

def decrypt(incoming)
	out = ""
	alphabet ="abcdefghijklmnopqrstuvwxyz"
	for i in 0 ... incoming.length
		if incoming[i] == "a"
			out = out + "z"
		elsif incoming[i] == " "
			out = out + " "
		else 
			out = out + alphabet[alphabet.index(incoming[i])-1]
		end
	end
	return out
end

# The driver code.

puts "Do you wish to encrypt or decrypt your password? (E/D)"
answer = gets.chomp
puts "Please enter the password."
password = gets.chomp

puts "Here is the coded message: "
if answer == "E"
	result1 = encrypt(password)
	puts "Encrypted: #{result1}"
elsif answer == "D"
	result2 = decrypt(password)
	puts "Decrypted: #{result2}"
else 
	"Please provide correct information. :("
end

# This undoes the decryption right doing the encryption.  This is a way to check that our program actually works.
decrypt(encrypt("swordfish"))