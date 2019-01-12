# simple examples of creating an unbalanced binary search tree from
# an unsorted array and running breadth first search, depth first search,
# recursive depth first search, and a conditional search of the tree.

require './tree'

ary = []
20.times {ary << rand(99)}
puts "input: unsorted array of #{ary.length} integers:"
p ary
index = rand(20)
target = ary[index]
puts "target to find: #{target}, at index #{index}"

tree = Tree.new(ary)
puts "\ntree has #{tree.size} nodes"


puts "\nbreadth first search:"
node, count = tree.breadth_first_search(target)
puts "searched #{count} nodes for #{target}, found #{node.value}"
node, count = tree.breadth_first_search(101)
puts "searched #{count} nodes for 101, found nil" if node == nil

puts "\ndepth first search:"
node, count = tree.depth_first_search(target)
puts "searched #{count} nodes for #{target}, found #{node.value}"
node, count = tree.depth_first_search(101)
puts "searched #{count} nodes for 101, found nil" if node == nil

puts "\ndepth first recursive search:"
node, count = tree.dfs_rec_count(target)
puts "searched #{count} nodes for #{target}, found #{node.value}"
node, count = tree.dfs_rec_count(101)
puts "searched #{count} nodes for 101, found nil" if node == nil

puts "\nconditional search:"
node, count = tree.conditional_search(target)
puts "searched #{count} nodes for #{target}, found #{node.value}"
node, count = tree.conditional_search(101)
puts "searched #{count} nodes for 101, found nil" if node == nil

# ---------------------- example ouput --------------------------------
# new randomized array created on each run, thus exact output will vary
# ---------------------------------------------------------------------

# => input: unsorted array of 20 integers:
# => [72, 49, 42, 93, 65, 70, 43, 47, 11, 34, 97, 43, 77, 21, 84, 55, 61, 90, 42, 98]
# => target to find: 47, at index 7

# => tree has 20 nodes

# => breadth first search:
# => searched 16 nodes for 47, found 47
# => searched 20 nodes for 101, found nil

# => depth first search:
# => searched 10 nodes for 47, found 47
# => searched 20 nodes for 101, found nil

# => depth first recursive search:
# => searched 7 nodes for 47, found 47
# => searched 20 nodes for 101, found nil

# => conditional search:
# => searched 5 nodes for 47, found 47
# => searched  nodes for 101, found nil
