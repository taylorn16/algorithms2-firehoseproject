class String
  def rot13
    # "Dictionaries"
    lowerCase = ("a".."z").to_a
    upperCase = ("A".."Z").to_a

    # Setup
    chars = self.chars
    rotated = []

    # Perform the rotation
    chars.each do |char|
      if lowerCase.include?(char)
        index = lowerCase.index(char)
        arr = lowerCase
      elsif upperCase.include?(char)
        index = upperCase.index(char)
        arr = upperCase
      elsif char == " "
        rotated << char
        next
      else
        raise StandardError, "Disallowed character."
      end

      rotated_index = index + 13
      if rotated_index > 25
        rotated_index -= 26
      end

      rotated << arr[rotated_index]
    end

    rotated.join('')
  end
end
