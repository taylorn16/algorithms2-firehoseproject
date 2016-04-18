module StringReverser
	def self.reverse(input)
		return nil if input.nil?
    return input.chars.reverse.join('')
	end

end
