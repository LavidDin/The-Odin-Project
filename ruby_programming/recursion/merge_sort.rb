def merge_sort(arr)
  if arr.length <= 1
    arr
  else
    half = (arr.length-1)/2
    left = merge_sort(arr[0..half])
    right = merge_sort(arr[half+1..-1])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..-1], right)
  else
    [right.first] + merge(left, right[1..-1])
  end
end


arr = Array.new(20) { rand(1..1000) }
p arr
p 'Here is the sorted array'
p merge_sort(arr)