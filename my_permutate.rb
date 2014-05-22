class String
  def all_possible_permutations
    self.chars.to_a.permutation.map(&:join)
  end
end


hsby = "abcdefghi".all_possible_permutations
print "#{hsby} #{hsby.size}"