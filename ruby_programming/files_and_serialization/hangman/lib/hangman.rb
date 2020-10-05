require_relative "serialize"

class Hangman
  include Serialize
  attr_reader :secret_word, :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    dictionary = File.readlines("5desk.txt").map(&:chomp)
    secret_word = ""
    until secret_word.length >= 5 && secret_word.length <= 12
      secret_word = dictionary.sample
    end
    secret_word
  end


  def initialize
    @secret_word = Hangman.random_word.downcase
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 12
  end

  def guess_word
    @guess_word.join('')
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    matching_indices = []

    @secret_word.each_char.with_index do |secret_char, i|
      if char == secret_char
        matching_indices << i
      end
    end
     matching_indices
  end

  def fill_indices(char, indices)
    indices.each do |index|
      @guess_word[index] = char
    end
  end

  def try_guess(char)
    char = char.downcase

    if char == 'save'
      save_game
    elsif char.length != 1
      p 'please enter a valid guess'
      return false
    elsif self.already_attempted?(char)
      p 'that letter has already been attempted'
      return false
    end

    @attempted_chars << char
    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)
    @remaining_incorrect_guesses -= 1 if matches.empty?
    true
  end


  def ask_user_for_guess
    p "Enter a char or type 'save' to save and quit:"
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'Congratulations you win!'
      return true
    end
    return false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'Sorry you lose'
      return true
    else
    return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p 'The secret word was: ' + @secret_word
      return true
    end
    return false
  end

  def save_game
    Dir.mkdir("saved_game") unless Dir.exists?("saved_game")

    saved_game = "saves/saved_game"

    File.open(saved_game, "w") {|file| file.puts self.serialize}

    puts "Game Saved"

    exit
  end

  def load_game
    saved_game = "saves/saved_game"

    data = File.read(saved_game)

    self.unserialize(data)

    puts "Game Save Load Successful!"
  end

  def check_load
    if File.exists?("saves/saved_game")
      print "Saved game found. Do you want to load a saved game? (Y/N): "
      input = gets.chomp.upcase
      load_game if input == "Y"
    end
  end


end
