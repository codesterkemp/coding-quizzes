def main
	battle_box
end

def battle_box(attackers)
	die_roll(attackers,defenders)
end
def die_roll
	if attackers < 3
		attackers
	else
		3
	end

	if defenders < 2
		defenders
	else 
		2
	end
