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
end
