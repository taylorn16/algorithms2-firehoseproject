module Uniques
  def self.cleanup(array)
    uniques = []
    array.each do |element|
      uniques << element unless uniques.include? element
    end
    return uniques
  end
end
