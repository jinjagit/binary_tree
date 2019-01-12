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

  def initialize
    @root = nil
    @size = 0
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
end


# --------- create tree from array of data and search (dfs & bfs) ----------

ary = []
20.times {ary << rand(99)}
p ary
puts "input: #{ary.length} integers"

tree = Tree.new
ary.each {|e| tree.add_node(e)}
puts "tree has #{tree.size} nodes"
