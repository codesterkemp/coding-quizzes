def euler1
	total = 0
	i = 0
	while i < 1000
		if i % 3 == 0
			total = i + total
		elsif i % 5 == 0
			total = i + total
		else
			"nothing"
		end
		puts " #{i} #{total}"
		i = i + 1		
	end
	puts "#{total}"
end

euler1