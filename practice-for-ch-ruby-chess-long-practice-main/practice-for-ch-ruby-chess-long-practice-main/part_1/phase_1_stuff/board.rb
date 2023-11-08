
class Board
  def initialize
    @grid = initialize_board
    initialize_pieces
    initialize_pawns
  end

  def initialize_board
    Array.new(8) { Array.new(8) { Piece.new } }
  end

  def initialize_pieces
    @grid[0][0] = Rook.new
    @grid[0][1] = Knight.new
    @grid[0][2] = Bishop.new
    @grid[0][3] = Queen.new
    @grid[0][4] = King.new
    @grid[0][5] = Bishop.new
    @grid[0][6] = Knight.new
    @grid[0][7] = Rook.new
    @grid[7][0] = Rook.new
    @grid[7][1] = Knight.new
    @grid[7][2] = Bishop.new
    @grid[7][3] = Queen.new
    @grid[7][4] = King.new
    @grid[7][5] = Bishop.new
    @grid[7][6] = Knight.new
    @grid[7][7] = Rook.new
  end

  def initialize_pawns
    @grid[1].map! { Pawn.new }
    @grid[6].map! { Pawn.new }
  end

  def move_piece(start_pos, end_pos)
    raise 'No piece at start_pos' unless piece_here?(start_pos)
    raise 'Piece cannot move to end_pos' unless valid_move?(start_pos, end_pos)

    move_piece_to(start_pos, end_pos)
  end

  def piece_here?(position)
    !self[position].is_a?(NullPiece)
  end

  def valid_move?(start_pos, end_pos)
    self[start_pos].valid_moves.include?(end_pos)
  end

  def move_piece_to(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
end


