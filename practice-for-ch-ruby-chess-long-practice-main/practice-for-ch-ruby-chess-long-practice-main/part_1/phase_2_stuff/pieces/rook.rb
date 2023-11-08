require_relative 'piece'
require_relative'slideable'

class Rook < Piece
    include Slideable
  
    def move_dirs
      VERT_HORI_DIRS
    end
  end