class Item
  attr_accessor :profit, :weight

  def initialize(profit, weight)
    @profit = profit
    @weight = weight
  end
end

def fractional_knapsack(w, arr)
  arr.sort_by! { |item| -item.profit.to_f / item.weight }

  final_value = 0.0

  arr.each do |item|
    if item.weight <= w
      w -= item.weight
      final_value += item.profit
    else
      final_value += item.profit * (w.to_f / item.weight)
      break
    end
  end

  final_value
end

# Test case without RSpec
items = [Item.new(60, 10), Item.new(100, 20), Item.new(120, 30)]
max_weight = 50
result = fractional_knapsack(max_weight, items)

puts "Maximum value achievable: #{result}"