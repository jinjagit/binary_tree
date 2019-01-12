# Binary Tree - Simon Tharby, 2019
# structure (relative data values); l_child <= parent, r_child > parent

class Node
  attr_accessor :l_child, :r_child
  attr_reader :value

  def initialize(value = nil)
    @value = value
    @l_child = nil
    @r_child = nil
  end
end

class Tree
  attr_reader :size

  def initialize(ary = nil)
    @root = nil
    @size = 0
    build_tree ary
  end

  def add_node(value)
    if @root == nil
      @root = Node.new(value)
      @size = 1
    else
      node = @root
      added = false
      while added == false do
        if value > node.value
          if node.r_child == nil
            node.r_child = Node.new(value)
            added = true
          else
            node = node.r_child
          end
        elsif value <= node.value
          if node.l_child == nil
            node.l_child = Node.new(value)
            added = true
          else
            node = node.l_child
          end
        end
      end
      @size += 1
    end
  end

  def build_tree(ary)
    ary.each {|e| add_node(e)} if ary != nil
  end

  def breadth_first_search(value)
    return nil, count = 0 if @root == nil
    queue = [@root]
    count = 0
    match = false
    while queue != [] && match == false do
      node = queue[0]
      count += 1
      if node.value == value
        match = true
      else
        queue << node.l_child if node.l_child != nil
        queue << node.r_child if node.r_child != nil
      end
      queue = queue.drop(1)
    end
    node = nil if match == false
    return node, count
  end

end


# --------- create tree from array of data and search (dfs & bfs) ----------

ary = []
20.times {ary << rand(99)}
p ary
puts "input: unsorted array of #{ary.length} integers"

tree = Tree.new(ary)
puts "tree has #{tree.size} nodes"
node, count = tree.breadth_first_search(ary[7])
puts "searched for #{ary[7]}, found #{node.value} in #{count} steps"
node, count = tree.breadth_first_search(101)
puts "searched for 101, found nil in #{count} steps" if node == nil
