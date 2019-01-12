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
end

ary_average = ary_search.inject(0){|sum,x| sum + x } / 1000.0
bfs_average = bfs_search.inject(0){|sum,x| sum + x } / 1000.0
dfs_average = dfs_search.inject(0){|sum,x| sum + x } / 1000.0

puts "array search v / n = #{ary_average}"
puts "         bfs v / n = #{bfs_average}"
puts "         dfs v / n = #{dfs_average}"

# --------------------- example output --------------------------------

# => array search v / n = 0.47309499999999965
# =>          bfs v / n = 0.50067
# =>          dfs v / n = 0.4915750000000003

# (over multiple runs no method varies much from v / n = 0.5)
