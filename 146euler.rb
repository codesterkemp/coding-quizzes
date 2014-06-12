def seqprimenum
	total = 0
	start = 149999000
	the_end = 150000002
	for n in start...the_end
		puts "#{n}"
		if sequencerunner(n**2)
			total = n + total
			puts "#{n}"
			puts total
		end
	end
	return total
end

def sequencerunner(the_n_sq)
	# icount = 0
	primearray = []
	for q in [1,3,7,9,13,27]
		primearray << (the_n_sq + q)
	end
	if !prime?(primearray)
		puts "FALSE \n"
		return false
	else
		puts "TRUE \n"*100
		return true
	end
end


def prime?(theprimes)
	for i in 2...((Math.sqrt(theprimes.sort.last)).round)
		for j in 0...theprimes.size
			if theprimes[j] % i == 0
				# puts "false at i = #{i}"
				return false
			end
		end
	end
	# puts "true until i = #{i}"
	return true
end

total = seqprimenum()
puts total

# 821107610


