class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(6) { Array.new(7, ' ') }
  end

  def place_mark(col, mark)
    5.downto(0).each do |row|
      if @grid[row][col] == ' '
        @grid[row][col] = mark
        return
      end
    end
  end

  def empty_col?(col)
    5.downto(0).each { |row| return true if @grid[row][col] == ' ' }
    false
  end

  def empty_board?
    0.upto(6).any? do |col|
      return true if empty_col?(col) 
    end
    false
  end

  def win_col?(mark)
    6.downto(0).each do |col|
      return true if 5.downto(2).all? { |row| @grid[row][col] == mark }
      return true if 4.downto(1).all? { |row| @grid[row][col] == mark }
      return true if 3.downto(0).all? { |row| @grid[row][col] == mark }
    end
    false
  end

  def win_row?(mark)
    5.downto(0).each do |row|
      return true if 6.downto(3).all? { |col| @grid[row][col] == mark }
      return true if 5.downto(2).all? { |col| @grid[row][col] == mark }
      return true if 4.downto(1).all? { |col| @grid[row][col] == mark }
      return true if 3.downto(0).all? { |col| @grid[row][col] == mark }
    end
    false
  end

  def win_diagonal?(mark)
    left_diagonals = false
    right_diagonals = false

    (3..5).each do |row|
      (0..3).each { |col| left_diagonals = true if @grid[row][col] == mark && @grid[row-1][col+1] == mark && @grid[row-2][col+2] && @grid[row-3][col+3] == mark }
    end

    (3..5).each do |row|
      6.downto(3).each { |col| right_diagonals = true if @grid[row][col] == mark && @grid[row-1][col-1] == mark && @grid[row-2][col-2] && @grid[row-3][col-3] == mark }
    end

    left_diagonals || right_diagonals
  end

  def win?(mark)
    win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
  end

  def print
    puts "       1     2     3     4     5     6     7
    |     |     |     |     |     |     |     |
    |  #{@grid[0][0]}  |  #{@grid[0][1]}  |  #{@grid[0][2]}  |  #{@grid[0][3]}  |  #{@grid[0][4]}  |  #{@grid[0][5]}  |  #{@grid[0][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|
    |     |     |     |     |     |     |     |
    |  #{@grid[1][0]}  |  #{@grid[1][1]}  |  #{@grid[1][2]}  |  #{@grid[1][3]}  |  #{@grid[1][4]}  |  #{@grid[1][5]}  |  #{@grid[1][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|
    |     |     |     |     |     |     |     |
    |  #{@grid[2][0]}  |  #{@grid[2][1]}  |  #{@grid[2][2]}  |  #{@grid[2][3]}  |  #{@grid[2][4]}  |  #{@grid[2][5]}  |  #{@grid[2][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|
    |     |     |     |     |     |     |     |
    |  #{@grid[3][0]}  |  #{@grid[3][1]}  |  #{@grid[3][2]}  |  #{@grid[3][3]}  |  #{@grid[3][4]}  |  #{@grid[3][5]}  |  #{@grid[3][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|
    |     |     |     |     |     |     |     |
    |  #{@grid[4][0]}  |  #{@grid[4][1]}  |  #{@grid[4][2]}  |  #{@grid[4][3]}  |  #{@grid[4][4]}  |  #{@grid[4][5]}  |  #{@grid[4][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|
    |     |     |     |     |     |     |     |
    |  #{@grid[5][0]}  |  #{@grid[5][1]}  |  #{@grid[5][2]}  |  #{@grid[5][3]}  |  #{@grid[5][4]}  |  #{@grid[5][5]}  |  #{@grid[5][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|"
  end
end