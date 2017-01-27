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
      possible_moves << move if in_board?(move)
    end
    possible_moves
  end

  def in_board?(pos)
    return false unless pos[0] <= 7 && pos[1] <= 7
  end

  def initialize(start_position)
    @start = start_position
    @end_pos = nil
    @move_tree = build_move_tree
    @visited_positions = start_position
  end

  def build_move_tree

  end

  def find_path
  end
end
