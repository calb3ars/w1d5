require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    board.each do |row|
      row.each do |col|
        pos = board[row][col]
        if pos.nil?
          update_mark
          new_board = board.dup
          new_board.pos == next_mover_mark
          TicTacToeNode.new(new_board, next_mover_mark, pos)
        end
      end
    end
  end

  def update_mark
    @next_mover_mark = (next_mover_mark == :X ? :O : :X)
  end

end
