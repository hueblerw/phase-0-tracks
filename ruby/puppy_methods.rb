class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(num)
  	n = 0
  	begin
  		puts "Woof!"
  		n += 1
  		# p n
  	end until num <= n
  end

  def roll_over()
  	puts "*rolls over*"
  end

  def dog_years(human_years)
  	human_years * 7
  end

  def lick_face(num_licks)
  	puts "*Dog licks your face #{num_licks} times*"
  	puts "*Your face is slobbery!"
  end 

  def initialize()
  	puts "Initializing new puppy instance ..."
  end

end


class Kitten

	def initialize()
		puts "A kitten is born ..."
	end

	def meow(num)
  		n = 0
  		begin
  			puts "Meow!"
  			n += 1
  		end until num <= n
  	end

  	def scratch_post()
  		puts "*The kitty scratches the post*"
  		puts "Purrrrr ..."
  	end 

  	

end


star = Puppy.new

# Tester code:
star.fetch("ball")
star.speak(3)
star.roll_over
puts "Star is #{star.dog_years(8)} old!"
star.lick_face(5)

# All the methods work. :)

n = 0
kitty = []

begin
	kitty << Kitten.new
	# p n
	n += 1
end until n == 50

kitty.each do |i|
	i.meow(2)
	i.scratch_post()
end