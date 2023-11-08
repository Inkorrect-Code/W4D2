require_relative 'piece'
require_relative'stepable'

class King < Piece
    include Stepable
  
    def move_diffs
      VERT_HORI_DIRS + DIAGONAL_DIRS
    end
  end