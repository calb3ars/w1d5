class KnightPathFinder

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

  attr_accessor :start, :visited_positions

  def initialize(start_position)
    @start = start_position
    @end_pos = nil
    @move_tree = build_move_tree
    @visited_positions = [start]
  end

  def new_move_positions(pos)
    new_positions = KnightPathFinder.valid_moves(pos) - visited_positions
    @visited_positions += new_positions
  end

  def build_move_tree

  end

  def find_path
  end
end
