require 'pp'
module LongestSubsequence

	def self.find(first, second)
    return nil if first.nil? || second.nil?

    matrix = LongestSubsequence.init_matrix(first.chars. second.chars)
	end

  def self.init_matrix(charr1, charr2)
    matrix = []
    charr1.unshift(nil).unshift(nil)
    charr2.unshift(nil).unshift(nil)

    # Initialize empty matrix
    (charr1.size).times do
      matrix << Array.new(charr2.size)
    end

    # Define edges with characters
    matrix[0] = charr2
    (0..(charr1.size - 1)).each do |i|
      matrix[i][0] = charr1[i]
    end

    # Define zero columns
    matrix[1][1, charr2.size - 1] = Array.new(charr2.size - 1, 0)
    (2..(charr1.size - 1)).each do |i|
      matrix[i][1] = 0
    end

    return matrix
  end

  def self.calculate_value(matrix, row, col)
    if matrix[0][col] == matrix[row][0]
      value = 1 + [matrix[row][col - 1], matrix[row - 1][col]].max
    else
      value = [matrix[row][col - 1], matrix[row - 1][col]].max
    end

    return value
  end

end

# Testing

pp LongestSubsequence.init_matrix(['a', 'b', 'c', 'd'], ['a', 'b', 'c'])
