require_relative '00_tree_node'
require 'byebug'
class KnightPathFinder < PolyTreeNode

  DELTAS = [
    [-2,-1],
    [2,-1],
    [-2,1],
    [2,1],
    [-1,-2],
    [-1,2],
    [1,-2],
    [1,2],
  ]

  def self.valid_moves(pos)
    possible_moves = []
    DELTAS.each do |delta|
      move = [pos[0] + delta[0], pos[1] + delta[1]]
      possible_moves << move if (move[0].between?(0,7) && move[1].between?(0,7))
    end
    possible_moves
  end

  attr_accessor :visited_positions, :start, :node

  def initialize(start_pos)
    @start = start_pos
    @end_pos = nil
    @visited_positions = [start]
    @node = PolyTreeNode.new(start)
    @move_tree = build_move_tree
  end

  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos) - visited_positions
    @visited_positions += new_positions
    new_positions
  end

  def build_move_tree
    queue = [node]
    until queue.empty?
      current_node = queue.shift

      new_move_positions(current_node.value).each do |pos|
        new_node = PolyTreeNode.new(pos)
        current_node.add_child(new_node)
        queue << new_node
      end

    end
  end

  def find_path(end_pos)
    end_node = node.dfs(end_pos)
    trace_back_path(end_node)
  end

  def trace_back_path(node)
    path = [node.value]
    par_pos = node.parent.value

    while node
      path << node.value unless node.value == path.last
      node = node.parent
    end

    # until par_pos == start
    #   path << par_pos
    #   node = node.parent
    #   par_pos = node.parent.value
    # end
    # path << par_pos
    path.reverse
  end

end
