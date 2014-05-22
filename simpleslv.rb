def editboard(board)
	exit = false
	while exit == false
		print "enter row #{j}"
	end
end

def loadboard
	#internet smoke = "500483001724006000003000540010600390607000408035001060078000100000200957200947003"
	# smoke = "008003000930000001070206005320000010000300020000000049000790006009068000500000000" #153 
	smoke = "000788530020690080040000500007806090381000000004002010402000001930000000000000627" #91 
	#smoke = "587090600020000030400000000000409002000100307748600000050900021190084050000006000" #21
	# fire = smoke.split
	coal = smoke.split("")
	return coal
end

def main
	game_board = start_game
	print_game_board(game_board)
	puts "Initial board"
	cycle = 1
	while cycle < 20
		game_board = engine_room(game_board)
		print_game_board(game_board)
		puts "the board after #{cycle} tries"
		cycle = cycle + 1
		check_for_soln(game_board)
		check_for_invalid_soln(game_board)
	end
end

def print_game_board(spaces)
	i = 0
	print " ||| "
	while(i < 81)
		print "|#{spaces[i][0]}|"
		i = i + 1
		if i % 9 == 0 
			puts " ||| "
			if i != 81
				print " ||| "
			end
		end
	end
end

def start_game
	spaces = []
	board = loadboard
	i = 0
	while(i < 81)
		spaces[i] = "123456789" ,board[i]
		# print "#{spaces[i][0]}  #{spaces[i][1]} \n"
		i = i + 1
	end
	i = 0
	while(i < 81)
		if !spaces[i][1].eql?("0")
			spaces[i][0] = spaces[i][1]
		end
		# print "#{spaces[i][0]}  #{spaces[i][1]} \n"
		i = i + 1
	end
	return spaces
end

def engine_room(spaces)
	i = 0
	while(i < 81 )
		if spaces[i][1].eql?("0")
			spaces[i][0].delete!(potential_values_line(i,spaces,1))
		end
		if spaces[i][1].eql?("0")
			spaces[i][0].delete!(potential_values_col(i,spaces,1))
		end
		if spaces[i][1].eql?("0")
			spaces[i][0].delete!(potential_values_sqr(i,spaces,1))
		end
		i = i + 1
	end
	spaces = narrow_board(spaces)
	return spaces
end

def potential_values_line(spot,spaces,pot)
	i = spot - spot % 9
	su_line ="#{spaces[i][pot]}#{spaces[i+1][pot]}#{spaces[i+2][pot]}#{spaces[i+3][pot]}#{spaces[i+4][pot]}#{spaces[i+5][pot]}#{spaces[i+6][pot]}#{spaces[i+7][pot]}#{spaces[i+8][pot]}"
	return su_line.to_s
end 

def potential_values_col(spot,spaces,pot)
	i = spot % 9
	su_col ="#{spaces[i][pot]}#{spaces[i+1*9][pot]}#{spaces[i+2*9][pot]}#{spaces[i+3*9][pot]}#{spaces[i+4*9][pot]}#{spaces[i+5*9][pot]}#{spaces[i+6*9][pot]}#{spaces[i+7*9][pot]}#{spaces[i+8*9][pot]}"	
	return su_col.to_s
end

def potential_values_sqr(spot,spaces,pot)
	row = (spot - (spot % 9)) / 9
	col = spot % 9
	c_section = (col - (col % 3)) / 3
	r_section = (row - (row % 3)) / 3
	i = (r_section * 27) + (c_section * 3)

	# puts "#{spot} #{row} #{col} #{r_section} #{c_section}"
	# puts "#{i} ipoint"
	su_sqr ="#{spaces[i][pot]}#{spaces[i+1][pot]}#{spaces[i+2][pot]}#{spaces[i+9][pot]}#{spaces[i+10][pot]}#{spaces[i+11][pot]}#{spaces[i+18][pot]}#{spaces[i+19][pot]}#{spaces[i+20][pot]}"
	return su_sqr.to_s
end 

def narrow_board(spaces)
	i = 0
	while(i < 81)
		
		checkpoint = spaces[i][0]
		
		if spaces[i][0].size == 1
			spaces[i][1] = spaces[i][0]
		elsif spaces[i][0].delete(potential_values_line(i,spaces,0).sub(checkpoint, '')).size == 1
			print "#{spaces[i][0] = spaces[i][0].delete(potential_values_line(i,spaces,0).sub(checkpoint, ''))} do" 
			puts " #{i}  #{spaces[i][0]} "
		elsif spaces[i][0].delete(potential_values_col(i,spaces,0).sub(checkpoint, '')).size == 1
			print "#{spaces[i][0] = spaces[i][0].delete(potential_values_col(i,spaces,0).sub(checkpoint, ''))} show" 
			puts " #{i}  #{spaces[i][0]} "
		elsif spaces[i][0].delete(potential_values_sqr(i,spaces,0).sub(checkpoint, '')).size == 1
			print "#{spaces[i][0] = spaces[i][0].delete(potential_values_sqr(i,spaces,0).sub(checkpoint, ''))} Soar "
			puts " #{i}  #{spaces[i][0]} "
			# puts "#{spaces[i][0]}    #{potential_values_line(i,spaces)}"
		end
		# print " postboard #{i} #{spaces[i][0]}  #{spaces[i][1]} \n"
	
		i = i + 1
	end
	return spaces
end

def check_for_soln(spaces)
	if spaces.all? { |the_space| the_space[0].length == 1 } #=> true
		puts "You're a Genius!!!"
	else
		puts "Getting Closer!"
	end
end

def check_for_invalid_soln(spaces)
	spaces.any? {|the_space | print "#{the_space[0]} cool beans   " }
	spaces.each_with_index {|the_space, the_index| }
	# if spaces.any? { |the_space| the_space[0].size == 0 }
	# 	return false
	# 	puts "Your're short a Genius and a half!"
	# end
	# if spaces.with_index_any? { |the_space, the_index| the_space[1].match((potential_values_line(the_index,spaces,1).sub(the_space[1], ''))) and the_space[1] != '0'}
	# 	puts "I beleive some numbers might be a bit overpopular on this line"
	# 	return false
	# elsif spaces.with_index_any?{ |the_space, the index| the_space[1].match((potential_values_col(the_index,spaces,1).sub(the_space[1], ''))) and the_space[1] != '0'}
	# 	puts "I beleive some numbers might be a bit overpopular on this col"
	# 	return false
	# elsif spaces.with_index_any? { |the_space, the_index| the_space[1].match((potential_values_line(the_index,spaces,1).sub(the_space[1], ''))) and the_space[1] != '0'}
	# 	puts "I beleive some numbers might be a bit overpopular in this square"
	# 	return false
	# else
	# 	true
	# end
end

	#for i = 1..9.to_s
		#if there is more than one match per number for spaces[1] for each row col and sqr
		#puts "I think we made a slight miscalculation."

	#end

# def does_it_have_to_be_on_this_line_in_this_sqr?
# 	#cycle thru the numbers
# 		#for each num check if a num onl
# end

# def does_it_have_to_be_in_this_sqr_on_this_line?

# end


main
#editboard(spaces)
# def line_by_line(spaces)
# 	i = 0
# 	su_line ="#{spaces[i][1]}#{spaces[i+1][1]}#{spaces[i+2][1]}#{spaces[i+3][1]}#{spaces[i+4][1]}#{spaces[i+5][1]}#{spaces[i+6][1]}#{spaces[i+7][1]}#{spaces[i+8][1]}"

# 	while(i < 81 )
# 		# puts su_line
# 		# print " pre board #{spaces[i][0]}  #{spaces[i][1]} \n"
# 		if spaces[i][1].eql?("0")
# 			spaces[i][0].delete!(su_line)
# 		end
# 		# print " postboard #{spaces[i][0]}  #{spaces[i][1]} \n"
# 		i = i + 1
# 		if i % 9 == 0 and i < 81
# 			su_line = "#{spaces[i][1]}#{spaces[i+1][1]}#{spaces[i+2][1]}#{spaces[i+3][1]}#{spaces[i+4][1]}#{spaces[i+5][1]}#{spaces[i+6][1]}#{spaces[i+7][1]}#{spaces[i+8][1]}"
# 		end
# 	end
# 	spaces = narrow_board(spaces)
# 	return spaces
# end

# def col_by_col(spaces)
# 	i = 0
# 	su_col ="#{spaces[i][1]}#{spaces[i+1*9][1]}#{spaces[i+2*9][1]}#{spaces[i+3*9][1]}#{spaces[i+4*9][1]}#{spaces[i+5*9][1]}#{spaces[i+6*9][1]}#{spaces[i+7*9][1]}#{spaces[i+8*9][1]}"
# 	while(i < 81 )	
# 		if spaces[i][1].eql?("0")
# 			spaces[i][0].delete!(su_col)
# 		end
	
# 		if i > 71 and i != 80
# 			i = i - 71 
# 			total = i+(8*9)
# 			su_col = "#{spaces[i][1]}#{spaces[i+1*9][1]}#{spaces[i+2*9][1]}#{spaces[i+3*9][1]}#{spaces[i+4*9][1]}#{spaces[i+5*9][1]}#{spaces[i+6*9][1]}#{spaces[i+7*9][1]}#{spaces[i+8*9][1]}"
# 		else
# 			i = i + 9
# 		end
# 	end
# 	spaces = narrow_board(spaces)
# 	return spaces
# end

# def sqr_by_sqr(spaces)
# 	i = 0
# 	su_sqr ="#{spaces[i][1]}#{spaces[i+1][1]}#{spaces[i+2][1]}#{spaces[i+9][1]}#{spaces[i+10][1]}#{spaces[i+11][1]}#{spaces[i+18][1]}#{spaces[i+19][1]}#{spaces[i+20][1]}"
# 	while(i < 81 )
		
# 		if spaces[i][1].eql?("0")
# 			spaces[i][0].delete!(su_sqr)
# 		end
# 		if spaces[i+9][1].eql?("0")
# 			spaces[i+9][0].delete!(su_sqr)
# 		end
		
# 		if spaces[i+18][1].eql?("0")
# 			spaces[i+18][0].delete!(su_sqr)
# 		end
# 		i = i + 1
# 		if i == 9
# 			i = 27
# 		end
# 		if i == 36
# 			i = 54
# 		end
# 		if i == 63
# 			i = 81
# 		end
# 		if i % 3 == 0 and i < 81
# 			su_sqr = "#{spaces[i][1]}#{spaces[i+1][1]}#{spaces[i+2][1]}#{spaces[i+9][1]}#{spaces[i+10][1]}#{spaces[i+11][1]}#{spaces[i+18][1]}#{spaces[i+19][1]}#{spaces[i+20][1]}"
# 		end
# 	end
# 	spaces = narrow_board(spaces)
# 	return spaces
# end

