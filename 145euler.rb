def reversibleNumCounter(target = 5000)
	revtotal = 0
	current = 0
	falsegap = 0
	while current < target
		oddball = current + current.to_s.reverse.to_i
		oddstring = oddball.to_s
		spot = 0
		reversable = true
		while spot < oddstring.length
			if current % 10 == 0
				reversable = false
				status = "divisible by ten"
			elsif oddstring[spot].to_i % 2 == 0
				reversable = false
				status = "divisible by two"
			end
			spot = spot + 1
		end
		#0puts "#{current} #{revtotal} #{reversable} #{status} #{oddball}"
		if reversable == true
			revtotal = revtotal + 1
			puts "at #{current} #{revtotal} the gap between true is #{falsegap}"
			falsegap = 0
			current = current + 2
		else
			falsegap = falsegap + 1
			current = current + jump
		end		
		



	end
	puts "the grand total #{revtotal}"
	puts "the gap between true is #{falsegap}"

end
reversibleNumCounter