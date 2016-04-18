module Factorial

  def self.of(number)
    return nil if number.nil?
    return 1 if number == 1
    return number * Factorial.of(number - 1)
  end


end
