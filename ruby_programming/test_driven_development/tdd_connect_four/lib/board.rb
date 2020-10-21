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

  def print
    puts "       1     2     3     4     5     6     7
    |     |     |     |     |     |     |     |
    |  #{@grid[0][0]}  |  #{@grid[0][1]}  |  #{@grid[0][2]}  |  #{@grid[0][3]}  |  #{@grid[0][4]}  |  #{@grid[0][5]}  |  #{@grid[0][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|
    |     |     |     |     |     |     |     |
    |  #{@grid[1][0]}  |  #{@grid[1][1]}  |  #{@grid[1][2]}  |  #{@grid[1][3]}  |  #{@grid[1][4]}  |  #{@grid[0][5]}  |  #{@grid[0][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|
    |     |     |     |     |     |     |     |
    |  #{@grid[2][0]}  |  #{@grid[2][1]}  |  #{@grid[2][2]}  |  #{@grid[2][3]}  |  #{@grid[2][4]}  |  #{@grid[0][5]}  |  #{@grid[0][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|
    |     |     |     |     |     |     |     |
    |  #{@grid[3][0]}  |  #{@grid[3][1]}  |  #{@grid[3][2]}  |  #{@grid[3][3]}  |  #{@grid[3][4]}  |  #{@grid[0][5]}  |  #{@grid[0][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|
    |     |     |     |     |     |     |     |
    |  #{@grid[4][0]}  |  #{@grid[4][1]}  |  #{@grid[4][2]}  |  #{@grid[4][3]}  |  #{@grid[4][4]}  |  #{@grid[0][5]}  |  #{@grid[0][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|
    |     |     |     |     |     |     |     |
    |  #{@grid[5][0]}  |  #{@grid[5][1]}  |  #{@grid[5][2]}  |  #{@grid[5][3]}  |  #{@grid[5][4]}  |  #{@grid[0][5]}  |  #{@grid[0][6]}  |
    |_____|_____|_____|_____|_____|_____|_____|"
  end

end


=begin
  
symbols:
● 
○
  
end