require_relative 'piece'

class Pawn < Piece
  def initialize(board, pos, color)
    super(board, pos, color)
    color == :white ? "♟" : "♙"
  end  
  
  def moves
      VERT_HORI_DIRS + DIAGONAL_DIRS
    end
  end

  private

  def at_start_row?
    (color == :white && pos[0] == 6) || (color == :black && pos[0] == 1)
  end

  