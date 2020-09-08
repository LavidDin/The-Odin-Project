class HumanPlayer
  attr_reader :mark

  def initialize(val)
    @mark = val
  end

  def get_position
    puts "Player #{mark.to_s}, enter the row of your choice"
    row = gets.chomp.to_i-1

    until row == 0 || row == 1 || row == 2
      puts "Only enter row 1,2 or 3"
      row = gets.chomp.to_i-1
    end

    puts "Player #{mark.to_s}, enter the column of your choice"
    col = gets.chomp.to_i-1

    until col == 0 || col == 1 || col == 2
      puts "Only enter row 1,2 or 3"
      col =gets.chomp.to_i-1
    end

    pos = [row,col]
    return pos
  end

end
