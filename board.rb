#board class

# a board has zones the 3 x 3 squares
# a board has spaces
class board
	def initialize(spaces) #size,zones
		# @size = size
		# @zones = zones
		@spaces = spaces # should be an array of of spaces
		spaces.each || space = Space.new
	end

	def space

end

