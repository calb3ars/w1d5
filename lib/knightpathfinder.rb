require_relative '00_tree_node'
require 'byebug'
class KnightPathFinder < PolyTreeNode

  DELTAS = [
    [-1,1],
    [-1,0],
    [-1,-1],
    [0,1],
    [0,-1],
    [1,1],
    [1,0],
    [1,-1]
  ]

  def self.valid_moves(pos)
    possible_moves = []
    DELTAS.each do |delta|
      move = [pos[0] + delta[0], pos[1] + delta[1]]
      possible_moves << move if (move[0].between?(0,7) && move[1].between?(0,7))
    end
    possible_moves
  end

  attr_accessor :visited_positions

  def initialize(start)
    @start = start
    @end_pos = nil
    @visited_positions = [start]
    @move_tree = build_move_tree
  end

  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos) - visited_positions
    @visited_positions += new_positions
    new_positions
  end

  def build_move_tree
    queue = [PolyTreeNode.new(start)]
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

  end

end
