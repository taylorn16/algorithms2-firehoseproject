class String
	def palindrome?
		return true if empty?
    sanitized = self.gsub(/[^A-Za-z]/, "")
    return sanitized.chars == sanitized.chars.reverse
	end

end
