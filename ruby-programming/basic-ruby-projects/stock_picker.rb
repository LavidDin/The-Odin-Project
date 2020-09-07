def stock_picker(arr)
  max = arr[1] - arr[0]
  buy_date = 0
  sell_date = arr.length-1


  (0...arr.length).each do |i|
    (i+1...arr.length).each do |i2|
      if (arr[i2] - arr[i] >= max) && i2 > i
        max = arr[i2] - arr[i]
        buy_date = i
        sell_date = i2
      end
    end
  end

  return "The best day to buy is day #{buy_date} and the best day to sell is day #{sell_date} for a profit of $#{max}."
end

print stock_picker([17,3,6,9,15,8,6,1,10])