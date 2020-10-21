def valid_move?(move)
  return true if (move[0] > -1 && move[0] < 8) && (move[1] > -1 && move[1] < 8)
  false
end

def possible_moves(pos)
  possible_moves = []
  [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]].each do |move|
    move[0] += pos[0]
    move[1] += pos[1]
    possible_moves.push(move)
  end
  possible_moves.select { |move| valid_move?(move) }
end

def knight_moves(start_square, end_square)
  path = [start_square]
  possible_paths = possible_moves(start_square).map { |position| path + [position] }

  loop do
    path = possible_paths.shift
    break if path[-1] == end_square
    possible_paths += possible_moves(path[-1]).map { |position| path + [position] }
  end

  puts "You made it in #{path.length - 1} moves! Here's your path:\n"
  path.each do |i|
    p i
  end
  puts ''
end

knight_moves([0, 0],[3, 3])