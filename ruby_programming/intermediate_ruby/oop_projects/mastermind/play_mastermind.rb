require_relative 'mastermind'
require_relative 'computer'

user_choice = 0

until user_choice == 3
  puts 'Welcome to Mastermind'
  puts 'Type 1 to play as the codebreaker'
  puts 'Type 2 to play as the codemaker'
  puts 'Type 3 to exit the game'
  user_choice = gets.chomp.to_i
  guesses = 12
  win = false

  #Human player (choice 1)
  if user_choice == 1
    mastermind = Mastermind.new
    win = false

      while guesses > 0
        win = mastermind.ask_user_for_guess
        guesses -= 1
          if win == true
            puts 'You are victorious!'
            break
          end
        puts "You have #{guesses} guesses remaining"
        puts "----------------------------------------------------------------------------"

        if guesses == 0 && win == false
          puts "Sorry. You Lose"
          puts "The secret code was: #{mastermind.secret_code.pegs.join('')}"
        end
      end
  end

  #Computer Player
  if user_choice == 2
    computer = Computer.new(Computer.ask_user_for_code)

    while guesses > 0
      win = computer.computer_guess
      guesses -= 1
        if win == true
          puts 'The computer is victorious!'
          break
        end
      puts "You have #{guesses} guesses remaining"
      puts "----------------------------------------------------------------------------"

      if guesses == 0 && win == false
        puts "The computer has lost"
        puts "Your secret code was: #{mastermind.secret_code.pegs.join('')}"
      end
    end
  end

  #Program exit
  break if user_choice == 3
end