# measurement of time complexity; result = v/n:
# where n = number of elements or nodes
# and v = number of array elements or nodes visited

require './tree'

def search_array(ary, value)
  count = 0
  match = false
  while match == false && count < ary.length do
    match = true if ary[count] == value
    count += 1
  end
  count
end

ary_search = []
bfs_search = []
dfs_search = []
dfs_rec_search = []
conditional_search = []

1000.times do
  ary = []
  200.times {ary << rand(999)}
  target = ary[rand(200)]
  ary_search << search_array(ary, target) / 200.0

  tree = Tree.new(ary)
  node, count = tree.breadth_first_search(target)
  bfs_search << count / 200.0
  node, count = tree.depth_first_search(target)
  dfs_search << count / 200.0
  node, count = tree.conditional_search(target)
  conditional_search << count / 200.0
end

ary_average = (ary_search.inject(0){|sum,x| sum + x } / 1000.0).round(3)
bfs_average = (bfs_search.inject(0){|sum,x| sum + x } / 1000.0).round(3)
dfs_average = (dfs_search.inject(0){|sum,x| sum + x } / 1000.0).round(3)
conditional_average = (conditional_search.inject(0){|sum,x| sum + x } / 1000.0).round(3)

puts "        array search v / n = #{ary_average}"
puts "breadth first search v / n = #{bfs_average}"
puts "  depth first search v / n = #{dfs_average}"
puts "  conditional search v / n = #{conditional_average}"

# --------------------- example output --------------------------------

# =>         array search v / n = 0.473
# => breadth first search v / n = 0.489
# =>   depth first search v / n = 0.497
# =>   conditional search v / n = 0.043


# over multiple runs only the conditional method varies much from v / n = 0.5
# and by a lot! (over 10 times 'faster' in terms of operations)
