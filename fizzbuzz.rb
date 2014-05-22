#3 fizz
#5 buzz
#15 fizzbuzz
def fizzbuzz
	i = 1
	while i < 101
		if i % 15 == 0
			puts "fizzbuzz"
		elsif i % 5 == 0
			puts "buzz"
		elsif i % 3 == 0
			puts "fizz"
		else
			puts "#{i}"
		end
		i = i + 1
	end
end

fizzbuzz
