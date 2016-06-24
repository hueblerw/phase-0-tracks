def buildarray(a, b, c)
	return [a, b, c]
end

def addarray(x, a)
	return x << a
end

puppies = []

p puppies

puppies << "Labrador"

puppies << "pug"

puppies << "german shepard"

puppies << "Dixon"

puppies << "huskey"

p puppies

puppies.delete_at(2)

p puppies

puppies.insert(2, "st_bernard")

p puppies

puppies.shift

p puppies

def puppyfinder(dog, puppies) 
	puppies.include?(dog)
	if puppies.include?(dog) == true
		puts "why yes, we do have #{dog}"
	else
		puts "NAW DUDE, WE GOT NOTHIN"
	end
end


puppyfinder("pug", puppies)

kitten = ["lion", "Bengal", "panther"]

abomination = puppies + kitten

p abomination

p addarray(kitten, "sabertooth")

p addarray(puppies, "corgi")

p addarray(abomination, "DUCK")

buildarray("overwatch", "battleborn", "lawbreakers")