require_relative "code"

class Computer

  attr_reader :pegs

  def self.ask_user_for_code
    puts "The choices are R:Red, G:Green, B:Blue, Y:Yellow, P:Purple and O:Orange"
    puts "Please enter your code like so e.g. RGBY"
    human_code = gets.chomp.to_s.upcase.split('')

      until Code.valid_pegs?(human_code)
        puts "Please enter a valid code"
        human_code = gets.chomp.to_s.upcase.split('')
      end
     human_code 
  end

  def initialize(human_code)
    @secret_code = Code.new(human_code)
    @computer_guess = ["R", "R", "R", "R"]
  end

  def computer_create_guess
    secret_code_arr = @secret_code.pegs

    (0..@computer_guess.length).each do |i|
      if @computer_guess[i] != secret_code_arr[i]
        @computer_guess[i] = Code.random_peg(@computer_guess[i])
      end
    end
    @computer_guess
  end


  def computer_guess
    computer_create_guess
    puts "Computer is guessing..."
    sleep(3)
    puts "Computer guessed: #{@computer_guess.join('')}"
    @secret_code.matches(@computer_guess)
    @secret_code == @computer_guess
  end
end
