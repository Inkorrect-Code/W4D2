module Slideable
    VERT_HORI_DIRS = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  
    def moves
      valid_moves = []
      move_dirs.each do |dir|
        dx, dy = dir
        valid_moves.concat(grow_unblocked_moves_in_dir(dx, dy))
      end
      valid_moves
    end
  
    def grow_unblocked_moves_in_dir(dx, dy)
      cur_x, cur_y = pos
      moves = []
  
      loop do
        cur_x, cur_y = cur_x + dx, cur_y + dy
        pos = [cur_x, cur_y]
  
        break unless board.valid_pos?(pos)
  
        if board.empty?(pos)
          moves << pos
        else
          moves << pos if board[pos].color != color
          break
        end
      end
  
      moves
    end
  end