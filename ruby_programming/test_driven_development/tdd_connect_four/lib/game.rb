require './lib/board.rb'

class Game
  attr_reader :player_1, :player_2, :current_player, :board

  def initialize(player_1 = '○', player_2 = '●')
    @player_1 = '○'
    @player_2 = '●'
    @current_player = @player_1
    @board = Board.new
  end

  def switch_turn
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
  end

  def get_position
    puts "Player #{@current_player}, enter a column to drop your piece"
    col = gets.chomp.to_i - 1

    until [0,1,2,3,4,5,6].include?(col)
      puts "Please enter a valid column. Try again"
      col = gets.chomp.to_i-1
    end

    col
  end

  def play    
    puts "Welcome to Connect Four"
    puts "Instructions:"
    puts "1) Players will take turns entering a column on the board"
    puts "2) The first player to connect four of their discs either horizontally, vertically or diagonally wins!"
    puts ""
    @board.print
    while @board.empty_board?
      puts "It is now #{@current_player}'s turn."
      col = get_position

      while @board.empty_col?(col) == false
        puts 'This column is full. Please enter a different column'
        col = get_position
      end

      @board.place_mark(col, @current_player)

      if @board.win?(@current_player)
        puts `clear`
        @board.print
        puts 'Game Over'
        puts @current_player + ' HAS WON!'
        return
      end
      puts `clear`
      switch_turn
      @board.print
    end

    @board.print
    puts 'Game Over'
    puts 'DRAW'
  end
end

#g = Game.new
#g.play