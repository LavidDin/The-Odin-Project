def substrings(word, dictionary)
  word_substrings = word.downcase.split(' ')
  words = []
  substrings_hash = Hash.new(0)

  word_substrings.each do |word|
    (0...word.length).each do |i|
      (i...word.length).each do |j|
        words << word[i..j]
      end
    end
  end

  words.each do |word|
    dictionary.each do |dic|
      substrings_hash[word] += 1 if dic ==(word)
    end
  end

  puts substrings_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

print substrings("Howdy partner, sit down! How's it going?", dictionary)
