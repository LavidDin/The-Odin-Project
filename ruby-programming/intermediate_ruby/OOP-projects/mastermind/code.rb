class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
    "P" => :purple,
    "O" => :orange
  }

  attr_reader :pegs

  #selects a random peg that doesn't include the give peg
  def self.random_peg(peg)
    pegs = POSSIBLE_PEGS.keys
    pegs.delete(peg)
    pegs.sample
  end

  #checks if the given characters are a valid entry
  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char)} && chars.length == 4
  end

  def self.random()
    random_pegs = []
    4.times { random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end

  def self.from_string(string)
    Code.new(string.split(''))
  end

  def initialize(chars)
    @pegs = chars
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def count_peg(peg)
    peg_count = 0
    (0..self.length).each do |i|
      peg_count +=1 if self[i] == peg
    end
    peg_count
  end

  def matches(guess_code)
    num_exact_matches = 0
    num_near_matches = 0

    code_non_matches =[]
    non_matches = []

    (0...guess_code.length).each do |i|
      if guess_code[i] == self[i]
        num_exact_matches += 1
      else
        code_non_matches << self[i]
        non_matches << guess_code[i]
      end
    end

    (0..code_non_matches.length).each do |i|
      if code_non_matches.include?(non_matches[i])
        index = code_non_matches.index(non_matches[i])
        code_non_matches.delete_at(index)
        num_near_matches += 1 
      end
    end

    puts "exact matches: #{num_exact_matches}"
    puts "near matches: #{num_near_matches}"
  end

  def ==(other_code)
    self.pegs == other_code
  end
  
end
