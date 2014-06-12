

# A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

# Considering natural numbers of the form, ab, where a, b < 100, what is the maximum digital sum?
def maximumdigitalsum
	amax = 99
	bmax = 99

	a = amax
	b = bmax
	highscore = [abest = 0,bbest = 0,thescore = 0]
	print"initial go - a is #{a} and b is #{b}"

	while b > 1
		a = amax
		puts "inside b loop - a is #{a} and b is #{b}"

		while a > 1
			puts "inside a loop - a is #{a} and b is #{b}"
			bignum = a**b
			puts "bignum is #{bignum}"
			mod = 10
			runningtotal = 0
			while bignum > 1
				puts "the total is #{ runningtotal }"
				puts "bignum is #{bignum}"
				runningtotal = runningtotal + (10*(bignum % mod)/mod)
				bignum = bignum - (bignum % mod)
				mod = mod*10
			end
			puts "the total is #{ runningtotal }"
			if runningtotal > highscore[2]
				highscore = [a,b,runningtotal]
			end
			a = a - 1
		end
		b = b - 1
	end
	puts "the max digital sum is #{highscore[2]} when a is #{highscore[0]} and b is #{highscore[1]}"
end

maximumdigitalsum