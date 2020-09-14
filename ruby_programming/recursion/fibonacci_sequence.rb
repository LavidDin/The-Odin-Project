#iteratively
def fibs(n)
  return if n == 0
  return [0] if n == 1 
  return [0, 1] if n == 2

  i = 2
  arr = [0, 1]
  while i < n
    arr << arr[i-1] + arr[i-2]
    i += 1
  end

  arr
end

#recursion
def fibs_rec(n, arr = [0,1])
  return if n == 0
  return [arr[0]] if n == 1
  return arr if n <= 2
  arr << (arr[-1] + arr[-2])
  fibs_rec(n-1,  arr)
end

puts 'Enter the length of the fibonacci sequence you would like to see:'
n = gets.chop.to_i
puts 'using iteration'
p fibs(n)
puts 'using recursion'
p fibs_rec(n)