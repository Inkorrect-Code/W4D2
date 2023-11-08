module Slideable
  HORIZONTAL_AND_VERTICAL = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  DIAGONAL = [[-1, -1], [-1, 1], [1, -1], [1, 1]]

  def moves
    valid_moves = []
    move_dirs.each do |dir|
      valid_moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end
    valid_moves
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    cur_x, cur_y = pos
    moves = []

    loop do
      cur_x, cur_y = cur_x + dx, cur_y + dy
      cur_pos = [cur_x, cur_y]

      break unless board.valid_pos?(cur_pos)

      if board.empty?(cur_pos)
        moves << cur_pos
      else
        moves << cur_pos if board[cur_pos].color != color
        break
      end
    end

    moves
  end
end

module Stepable
  def moves
    valid_moves = []
    move_diffs.each do |(dx, dy)|
      cur_x, cur_y = pos
      cur_pos = [cur_x + dx, cur_y + dy]

      next unless board.valid_pos?(cur_pos)

      if board.empty?(cur_pos) || board[cur_pos].color != color
        valid_moves << cur_pos
      end
    end

    valid_moves
  end
end

class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end

class Pawn < Piece
  def initialize(color, board, pos)
    super
  end

  def moves
    forward_steps + side_attacks
  end

  def symbol
    '♟'
  end

  private

  def at_start_row?
    (color == :white && pos[0] == 6) || (color == :black && pos[0] == 1)
  end

  def forward_dir
    color == :white ? -1 : 1
  end

  def forward_steps
    x, y = pos
    one_step = [x + forward_dir, y]
    return [] unless board.valid_pos?(one_step) && board.empty?(one_step)

    steps = [one_step]

    if at_start_row?
      two_steps = [x + 2 * forward_dir, y]
      steps << two_steps if board.empty?(two_steps)
    end

    steps
  end

  def side_attacks
    x, y = pos
    attack_positions = [[x + forward_dir, y - 1], [x + forward_dir, y + 1]]
    attack_positions.select do |new_pos|
      next false unless board.valid_pos?(new_pos)
      next false if board.empty?(new_pos)

      attacked_piece = board[new_pos]
      attacked_piece.color != color
    end
  end
end

class NullPiece < Piece
  require 'singleton'
  include Singleton

  def initialize
    @color = nil
  end

  def moves
    []
  end

  def symbol
    ' '
  end
end
