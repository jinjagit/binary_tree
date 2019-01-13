# Unbalanced Binary Search Tree - Simon Tharby, 2019
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
  attr_reader :size, :root

  def initialize(ary = nil)
    @root = nil
    @size = 0
    @rec_count = 0
    build_tree ary
  end

  def add_node(value)
    if @root.nil?
      @root = Node.new(value)
      @size = 1
    else
      node = @root
      added = false
      while added == false do
        if value > node.value
          if node.r_child.nil?
            node.r_child = Node.new(value)
            added = true
          else
            node = node.r_child
          end
        elsif value <= node.value
          if node.l_child.nil?
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
    ary.each {|e| add_node(e)} unless ary.nil?
  end

  def breadth_first_search(value)
    return nil, count = 0 if @root.nil?
    queue = [@root]
    count = 0 # counter for analysis, not needed for search
    match = false
    while queue != [] && match == false do
      node = queue[0]
      count += 1
      if node.value == value
        match = true
      else
        queue << node.l_child unless node.l_child.nil?
        queue << node.r_child unless node.r_child.nil?
      end
      queue = queue.drop(1)
    end
    node = nil if match == false
    return node, count
  end

  def depth_first_search(value) #preorder dfs
    return nil, count = 0 if @root.nil?
    stack = [@root]
    count = 0 # counter for analysis, not needed for search
    match = false
    while stack != [] && match == false do
      node = stack[-1]
      stack.pop
      count += 1
      if node.value == value
        match = true
      else
        stack << node.r_child unless node.r_child.nil?
        stack << node.l_child unless node.l_child.nil?
      end
    end
    node = nil if match == false
    return node, count
  end

  def dfs_rec(node = @root, value) # recursive dfs
    return nil if node.nil?
    return node if node.value == value
    result = dfs_rec(node.l_child, value)
    return result unless result.nil?
    @count += 1 # counter for analysis, not needed for search
    dfs_rec(node.r_child, value)
  end

  # return dfs_rec result and number of times dfs_rec called itself
  def dfs_rec_count(value)
    @count = 0
    node = dfs_rec(value)
    @count = 1 if @count == 0
    return node, @count
  end

  def conditional_search(value)
    return nil, count = 0 if @root.nil?
    node = @root
    match = false
    count = 0
    while match == false do
      count += 1
      if node.value == value
        match = true
      elsif node.value > value
        return nil, count if node.l_child.nil?
        node = node.l_child
      elsif node.value < value
        return nil, count if node.r_child.nil?
        node = node.r_child
      end
    end
    if match == false
      return nil, count
    else
      return node, count
    end
  end
end
