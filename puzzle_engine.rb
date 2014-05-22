#puzzle_engine.rb

#
class Space
	def initialize(row, column, value = nil , p_values = [1,2,3,4,5,6,7,8,9])
		@row = row
		@column = column
		@value = value
		@p_values = p_values
		@sector = sector
	end

	def row
		@row = row
	end

	def column
		@column = column
	end

	def sector(z_col = 3,z_row = 3)
		row = self.row
		col = self.col
		@sector = (z_row*((row-1)/3)) + (((z_col-1)/3)+1 )
	end

end

def main(size = 2)
	#ask for input
	the_puzzle(size)
end

def the_puzzle(size) 
	puts "please enter the clues using the below format"
	puts "row, col, value"
	puts "when you finish entering the clues type 0,0,0"

	space = 


end

def update_space_p_values
	#for all spaces

	space.col_check
	space.row_check
	space.sector_check

def col_check
	#stuff
	col_mates = self.col


end

def row_check
	#stuff
end

def sector_check
	#stuff
end

def numbers_check
	#stuff

end

