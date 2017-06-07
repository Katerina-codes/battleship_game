require_relative 'player'
require_relative 'display'

class MoveValidator

  def is_number_valid?(number)
    number
    number.to_i >= 1 && number.to_i <= 10 && number.length <= 1
  end

  def is_letter_valid?(letter)
    range = ("a".."j").to_a
    range.include?(letter)
  end

end
