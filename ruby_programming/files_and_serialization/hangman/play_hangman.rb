require "./lib/hangman.rb"

user_choice = 0

  puts 'Welcome to Hangman'

  hangman = Hangman.new

  hangman.check_load

  until hangman.game_over?
    puts "Guesses Remaining: #{hangman.remaining_incorrect_guesses}"
    puts "Attempted Chars: #{hangman.attempted_chars}"
    puts "Word: #{hangman.guess_word}"
    print "\n" until hangman.ask_user_for_guess
    print "\n\n"
  end
