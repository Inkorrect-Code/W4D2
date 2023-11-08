require_relative 'piece'
require_relative'slideable'

class Queen < Piece
    include Slideable
  
    def move_dirs
      VERT_HORI_DIRS + DIAGONAL_DIRS
    end
  end