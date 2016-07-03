module Shout

	def self.yell_angrily(words)
    	words + "!!!" + " :("
  	end

  	def self.yelling_happily(words)
  		words.upcase + "!!!  :)"
  	end

end

# -----------------------

words = "You bought a cat"

p Shout.yell_angrily(words)
p Shout.yelling_happily(words)