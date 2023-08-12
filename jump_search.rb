class JumpSearch
  def self.search(arr, x)
    n = arr.length
    step = Math.sqrt(n).to_i

    prev = 0
    while arr[[step, n].min - 1] < x
      prev = step
      step += Math.sqrt(n).to_i
      return -1 if prev >= n
    end

    while arr[prev] < x
      prev += 1
      return -1 if prev == [step, n].min
    end

    return prev if arr[prev] == x
    -1
  end
end

# Testing the code
arr = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]

x = 55

index = JumpSearch.search(arr, x)

if index != -1
  puts "Number #{x} is at index #{index}"
else
  puts "Number #{x} is not present in the array"
end