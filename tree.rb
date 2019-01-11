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
