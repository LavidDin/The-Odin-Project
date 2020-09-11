class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end
  
  def empty?(pos)
    row, col = pos
    @grid[row][col] == '_'
  end

  def place_mark(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def print
    puts "        1     2     3
          |     |     
    1   #{@grid[0][0]} |  #{@grid[0][1]}  |  #{@grid[0][2]}  
     _____|_____|_____
          |     |     
    2   #{@grid[1][0]} |  #{@grid[1][1]}  |  #{@grid[1][2]}  
     _____|_____|_____
          |     |     
    3   #{@grid[2][0]} |  #{@grid[2][1]}  |  #{@grid[2][2]}
          |     |     "
  end

  def win_row?(mark)
    @grid.any? { |row| row.all?(mark) }
  end

  def win_col?(mark)
    @grid.transpose.any? { |col| col.all?(mark) }
  end

  def win_diagonal?(mark)
    left_to_right = (0...@grid.length).all? do |i|
      @grid[i][i] == mark
    end

    right_to_left = (0...@grid.length).all? do |i|
      row = i
      col = @grid.length - 1 - i
      @grid[row][col] == mark
    end

    left_to_right || right_to_left
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.any? { |row| row.any? { |pos| pos == '_'} }
  end
end