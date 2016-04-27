module StringReverser
	def self.reverse(input)
		return nil if input.nil?
    return input.chars.reverse.join('')
    # Use "stack" to reverse
	end
end
