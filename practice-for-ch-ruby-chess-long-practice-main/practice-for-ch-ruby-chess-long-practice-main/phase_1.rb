class Piece
end

class NullPiece < Piece
end

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) { Piece.new } }
    @grid[0][0] = Rook.new
    @grid[0][1] = Knight.new
    @grid[0][2] = Bishop.new
    @grid[0][3] = Queen.new
    @grid[0][4] = King.new
    @grid[0][5] = Bishop.new
    @grid[0][6] = Knight.new
    @grid[0][7] = Rook.new
    @grid[1].map! { Pawn.new }
    @grid[6].map! { Pawn.new }
    @grid[7][0] = Rook.new
    @grid[7][1] = Knight.new
    @grid[7][2] = Bishop.new
    @grid[7][3] = Queen.new
    @grid[7][4] = King.new
    @grid[7][5] = Bishop.new
    @grid[7][6] = Knight.new
    @grid[7][7] = Rook.new
  end

  def move_piece(start_pos, end_pos)
    raise 'No piece at start_pos' if self[start_pos].is_a?(NullPiece)
    raise 'Piece cannot move to end_pos' unless self[start_pos].valid_moves.include?(end_pos)

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end

  def 
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
end

class SlidingPiece < Piece
end

class SteppingPiece < Piece
end

class Bishop < SlidingPiece
end

class Rook < SlidingPiece
end

class Queen < SlidingPiece
end

class Knight < SteppingPiece
end

class King < SteppingPiece
end

class Pawn < Piece
end
