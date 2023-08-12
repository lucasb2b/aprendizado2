class FibonacciSearch
  def self.search(arr, x)
    n = arr.length
    fib_m_minus_2 = 0
    fib_m_minus_1 = 1
    fib_m = fib_m_minus_2 + fib_m_minus_1

    while fib_m < n
      fib_m_minus_2 = fib_m_minus_1
      fib_m_minus_1 = fib_m
      fib_m = fib_m_minus_2 + fib_m_minus_1
    end

    offset = -1

    while fib_m > 1
      i = [offset + fib_m_minus_2, n - 1].min

      if arr[i] < x
        fib_m, fib_m_minus_1, fib_m_minus_2 = fib_m_minus_1, fib_m_minus_2, fib_m - fib_m_minus_1
        offset = i
      elsif arr[i] > x
        fib_m, fib_m_minus_1, fib_m_minus_2 = fib_m_minus_2, fib_m_minus_1 - fib_m_minus_2, fib_m - fib_m_minus_1
      else
        return i
      end
    end

    return n - 1 if fib_m_minus_1 != 0 && arr[n - 1] == x
    return -1
  end
end

# Simple Test

arr = [10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100, 235]
x = 235
ind = FibonacciSearch.search(arr, x)

if ind >= 0
  puts "Found at index: #{ind}"
else
  puts "#{x} isn't present in the array"
end