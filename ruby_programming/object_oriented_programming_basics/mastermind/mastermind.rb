require_relative "code"

class Mastermind
  def initialize
    @secret_code = Code.random
  end

  attr_reader :secret_code

  def ask_user_for_guess
    puts 'The choices are R:Red, G:Green, B:Blue, Y:Yellow, P:Purple and O:Orange'
    puts 'Please enter your guess like so e.g. RGBY'
    guess_code = gets.chomp.to_s.upcase.split('')

      until Code.valid_pegs?(guess_code)
        puts 'Please enter a valid guess'
        guess_code = gets.chomp.to_s.upcase.split('')
      end

    @secret_code.matches(guess_code)
    @secret_code == guess_code
  end

end
