def caesar_cipher(string, x)
  alpha = ('a'..'z').to_a
  shifted_string_arr = []

  string.each_char.with_index do |char, i|
    upcase = false
    #upcase?
    if char == char.upcase
      upcase = true
      char = char.downcase
    end

    if alpha.include?(char)
      char_index = alpha.index(char)
      new_char_index = (char_index + x) % 26
      new_char = alpha[new_char_index]
      if upcase
        shifted_string_arr << new_char.upcase
      else
        shifted_string_arr << new_char
      end
    else
      shifted_string_arr << char
    end
  end
    shifted_string_arr.join('')

end

print caesar_cipher("What a string!", 5)