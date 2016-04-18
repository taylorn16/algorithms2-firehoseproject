class LargestPrimeFactor

  def largest_prime_of(number)
    return nil if number.nil?

    factors = factors_of number
    factors[1, factors.size - 2].reverse.each do |factor|
      return factor if is_prime?(factor)
    end

    return 1
  end

  def is_prime?(number)
    (2..(number - 1)).each do |num|
      return false if number % num == 0
    end

    return true
  end

  def factors_of(number)
    factors = []
    (1..number).each do |num|
      factors << num if number % num == 0
    end

    return factors
  end

end
