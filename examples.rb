# simple examples of creating a binary tree from an array
# and running breadth first search, depth first search,
# and a recursive depth first search of the binary tree:

require './tree'

ary = []
20.times {ary << rand(99)}
p ary
puts "input: unsorted array of #{ary.length} integers"

tree = Tree.new(ary)
puts "tree has #{tree.size} nodes"

puts "\ndepth first search:"
node, count = tree.breadth_first_search(ary[7])
puts "searched for #{ary[7]}, found #{node.value} in #{count} steps"
node, count = tree.breadth_first_search(101)
puts "searched for 101, found nil in #{count} steps" if node == nil
