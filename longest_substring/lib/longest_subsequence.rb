module LongestSubsequence

	def self.find(first, second)
    return nil if first.nil? || second.nil?

    curr_sequence = {
      :length => 0,
      :chars => []
    }

    first_possibles = first.chars.permutation.to_a
    second_possibles = second.chars.permutation.to_a

    first_possibles.each do |charr1|
      second_possibles.each do |charr2|
        new_sequence = LongestSubsequence.shared_sequence(charr1, charr2)
        if new_sequence[:length] > curr_sequence[:length]
          curr_sequence = new_sequence
        end
      end
    end

    return curr_sequence[:length] == 0 ? nil : curr_sequence[:chars].sort.join('')
	end

  def self.shared_sequence(charr1, charr2)
    return nil if charr1.nil? || charr2.nil?

    sequence = {
      :length => 0,
      :chars => []
    }

    if charr1.size > charr2.size
      iterated = charr2
      compared = charr1
    else
      iterated = charr1
      compared = charr2
    end

    iterated.each_with_index do |elem, i|
      if elem == compared[i]
        sequence[:length] += 1
        sequence[:chars] << elem
      end
    end

    return sequence
  end

end
