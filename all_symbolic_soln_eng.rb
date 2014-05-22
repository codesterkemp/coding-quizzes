# given that the top row is represented by
#
# abc|def|ghi
#
class String
  def all_possible_permutations
    self.chars.to_a.permutation.map(&:join)
  end
end

def main_run()
  main_string = ["abcdefghi"]
list_of_strings = main_string[0].all_possible_permutations
   final_boards = multi_string(main_string,list_of_strings)

  #  final_boards.each do |board|
  #  puts "#{board[0,9]}"
  #  puts "#{board[10,18]}"
  #  puts "#{board[19,27]}"
  #  puts
  #  puts
  # end
end

def multi_string(main_list,sub_list)
  boards = []      
    main_list.each do |the_string|

    new_boards = build_soln(the_string,sub_list)
    boards = new_boards + boards
    end
  return boards

end

def build_soln(the_string,list_of_strings)
        sub_string = row_comp(the_string,list_of_strings)

        if sub_string[0].size < 27
        boards = multi_string(sub_string,sub_string)
        else
          boards = sub_string
      end
      return boards
end

def row_comp(main_string,list_of_strings)
  my_substring = []
  i = 0
  while i < list_of_strings.size
    if !dup_col?(main_string,list_of_strings[i])
      new_row = list_of_strings[i]
      composite_str = main_string+new_row[-9,9]
      my_substring << composite_str 
    end
    i = i+1
  end
  return my_substring
end

def dup_col?(str1,str2)
  i = 0
  str3 = ""
  str4 = ""
  while i < 9

    str3 =str1[-i]+str1[-1]+str1[-2]
    str4 =str2[-i]


    if str1[-i-1] == str2[-i-1]
      return true
    end
    i = i+1
  end
  return false
end

main_run()


# def record_board?
# 	if dup_col?
# 		false
# 	elsif dup_grid?
# 		false
# 	else
# 		true
# 	end
# end

# def dup_col?
# 	#
# end

# def dup_grid?
# 	#
# end




