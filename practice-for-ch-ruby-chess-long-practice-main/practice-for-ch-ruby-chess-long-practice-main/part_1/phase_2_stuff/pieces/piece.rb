require 'colorize'

class Piece
    attr_reader :board, :pos, :color
  
    def initialize(board, pos, color)
      @board = board
      @pos = pos
      @color = color
    end
  
    def moves
      # To be implemented in subclasses
      raise NotImplementedError
    end
  end