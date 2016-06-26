government = {
	"leader" => "Wallace Rigor",
	"council" => {
		"treasurer": "Alotta Monee",
		"general": "Harold T. Bombs",
		"judge": "Dudley Do-Right"
	}
	"treasury" => 50000,
	"notorized_blank_paper" => 12000,
	"employees" = {
		"Police Chief" => "Mr. Handcuffs",
		"Prison_Guard" => "Gurad Prisson"
	}
	"prisoners" => [
		"Speedy McGee", 
		"Mr. Greasylawyer", 
		"Johnny Stealightly"
	]
	"cabinets" => 45
}

# Return the treasurer, we need some money:
p "Treasurer: #{government[:council][:treasurer]}"

# Deduct $20000 from the treasury and one notorized paper to that effect.
government[:treasury] -= 20000
government[:notorized_blank_paper] -= 1

p "Cash: #{government[:treasury]} // paper: #{government[:notorized_blank_paper]}"
