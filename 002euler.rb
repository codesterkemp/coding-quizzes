def euler2
	total = 0
	iold = 1
	i = 2
	while i < 4000000
		if i % 2 == 0
			total = i + total		
		else
			"nothing"
		end
		puts " #{i} #{total}"
		hold_i = i
		i = i + iold
		iold = hold_i
	end
	puts "#{total}"
end

euler2