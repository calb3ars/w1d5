class PolyTreeNode
  attr_accessor :parent, :children
  attr_reader :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def parent=(parent)
    if parent != @parent && @parent != nil
      @parent.children.delete(self)
    end

    unless parent.nil? || parent.children.include?(self)
      parent.children << self
    end

    @parent = parent
  end

  def children
    @children
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise "Passed Node is not a child" unless children.include?(child_node)
    child_node.parent=(nil)
  end

  def value
    @value
  end

  def dfs(target_value)
    return self if value == target_value
    children.each do |child_node|
      result = child_node.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      queue += current_node.children
    end
    nil
  end

end
