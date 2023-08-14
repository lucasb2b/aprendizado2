class PaperCutter
  def self.minimum_square(a, b)
    result = 0

    if a < b 
      a, b = b, a
    end

    while b > 0
      result += a / b
      rem = a % b
      a = b
      b = rem
    end

    result
  end
end

n = 13
m = 29
puts PaperCutter.minimum_square(n, m)