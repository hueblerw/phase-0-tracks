done = false
begin
puts "How many potential employees should be processed today?"
num = gets.chomp
	if num == (num.to_i).to_s
		num = num.to_i
		done = true
	else
		puts "This input is invalid try again."
	end
end until done

for i in 1 .. num

puts "What is your name?"
name = gets.chomp

done = false
begin
puts "How old are you?"
age = gets.chomp
	if age == (age.to_i).to_s
		age = age.to_i
		done = true
	else
		puts "This input is invalid try again."
	end
end until done

done = false
begin
puts "What year were you born in?"
date_of_birth = gets.chomp
	if date_of_birth == (date_of_birth.to_i).to_s
		date_of_birth = date_of_birth.to_i
		done = true
	else
		puts "This input is invalid try again."
	end
end until done

done = false
begin 
	puts "Our company cafeteria serves garlic bread. Should we order some for you? (Y/N)"
	incoming = gets.chomp
	incoming = incoming.downcase
	case incoming
		when "y" , "yes"
			garlic = true
			done = true
		when "n" , "no"
			garlic = false
			done = true
		else
			puts "This input is invalid try again."
	end
end until done

done = false
begin
	puts "Would you like to enroll in our company's health insurance? (Y/N)"
	incoming = gets.chomp
	incoming = incoming.downcase
	case incoming
		when "y" , "yes"
			healthcare = true
			done = true
		when "n" , "no"
			healthcare = false
			done = true
		else
			puts "This input is invalid try again."
	end
end until done

current_date = 2016

if current_date - age == date_of_birth || current_date - age - 1 == date_of_birth
	dates_match = true
else
	dates_match = false
end

if dates_match && (garlic || healthcare)
	vampire = "Probably not a vampire."
elsif !dates_match && (!garlic || !healthcare)	
	vampire = "Probably a vampire."
elsif !dates_match && !garlic && !healthcare
	vampire = "Almost certainly a vampire."
else
	vampire = "Results inconclusive."
end

if name == "Drake Cula" || name == "Tu Fang"
	vampire = "Definitely a vampire!"
end

puts "Please list any allergies you have."
done = false
begin
	incoming = gets.chomp
	if incoming == "sunshine"
		vampire = "Probably a vampire!"
		break
	elsif incoming == "done" || incoming == "no"  || incoming == "none"
		done = true
	else
		puts "Interesting, do you have any other allergies?"
	end
end until done

puts "Here are your results for applicant #{i}:"
puts vampire

end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

# Yeah we just gathered this data for . . . uh, research purposes . . . yeah!