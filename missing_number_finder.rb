class MissingNumberFinder
  def initialize(array)
    @array = array
  end

  def find_missing_number
    x1 = @array[0]
    x2 = 1

    (1..(@array.length - 1)).each { |i| x1 ^= @array[i]}
    (2..(@array.length + 1)).each { |i| x2 ^= i }

    x1^x2
  end
end

# Use example
arr = [1, 2, 3, 4, 5, 7]
finder = MissingNumberFinder.new(arr)
missing_number = finder.find_missing_number
puts missing_number