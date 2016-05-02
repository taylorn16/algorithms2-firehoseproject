require 'pp'
module LongestSubsequence

	def self.find(first, second)
    return nil if first.nil? || second.nil?
    chars = []

    matrix = LongestSubsequence.init_matrix(first.chars, second.chars)
    (2..(matrix.size - 1)).each do |row|
      (2..(matrix[row].size - 1)).each do |col|
        chars << matrix[0][col] if LongestSubsequence.check_match(matrix, row, col)
        matrix[row][col] = LongestSubsequence.calculate_value(matrix, row, col)
      end
    end

    if matrix.last.last == 0
      return nil
    else
      return chars.uniq.sort.join("")
    end
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

    matrix
  end

  def self.check_match(matrix, row, col)
    matrix[0][col] == matrix[row][0]
  end

  def self.calculate_value(matrix, row, col)
    if LongestSubsequence.check_match(matrix, row, col)
      value = 1 + matrix[row - 1][col - 1]
    else
      value = [matrix[row][col - 1], matrix[row - 1][col]].max
    end

    value
  end

end
