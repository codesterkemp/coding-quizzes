#spaces.rb
class Space
	def initialize(location, value = nil , p_values = [1,2,3,4,5,6,7,8,9])
		@location = location # should be a single num starting with 1 in the upper left corner and ending with 81 in the bottom right corner
		@value = value
		@p_values = value || p_values
	end

	def value
		@value || 0
	end

	def row(rows = 9)
		@row = ((@location-1)/rows)+1
	end

	def col(cols = 9)
		@col = @location%cols
		if @col == 0
			@col = cols
		end
		@col
	end

	def zone(z_col = 3,z_row = 3)
		row = self.row
		col = self.col
		@zone = (z_row*((row-1)/3)) + (((z_col-1)/3)+1 )
	end

end

def print_board()
	puts ""
	print 
end

def generate_blank_board(size = 81)
	the_space = 0
	the_board = []
	while the_space < size
		the_board[the_space] = Space.new(the_space+1)
		the_space = the_space + 1
	end
	return the_board
end

def generate_starting_entries(my_board,input) 
	mycount = 0
	while mycount < input.size
		my_board[input[mycount]-1] = Space.new(input[mycount],input[mycount+1])
		mycount = mycount + 2 
	end
end

my_board = generate_blank_board()
input = [1,4,2,8,5,9,10,3,14,1,15,4,17,9,19,6,24,7,28,2,29,1,31,7,34,8,36,4,39,6,43,5,46,8,48,4,51,2,53,9,54,6,58,4,63,9,66,8,68,5,69,1,72,2,77,2,80,1,81,8]
my_board = generate_starting_entries(my_board,input)
my_space = my_board[2]
puts my_space.row
puts my_space.col
puts my_space.zone
puts my_space.value