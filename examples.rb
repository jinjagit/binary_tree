# simple examples of creating a binary tree from an array
# and running breadth first search, depth first search,
# and a recursive depth first search of the binary tree:

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
