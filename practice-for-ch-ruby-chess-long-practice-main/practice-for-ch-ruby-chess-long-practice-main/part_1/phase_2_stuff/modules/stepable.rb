module Stepable
    def moves
      valid_moves = []
      move_diffs.each do |(dx, dy)|
        cur_x, cur_y = pos
        new_pos = [cur_x + dx, cur_y + dy]
  
        next unless board.valid_pos?(new_pos)
  
        if board.empty?(new_pos)
          valid_moves << new_pos
        elsif board[new_pos].color != color
          valid_moves << new_pos
        end
      end
  
      valid_moves
    end
  end