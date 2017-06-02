require_relative 'player'
require_relative 'display'

class MoveValidator

  def initialize(display, player)
    @display = display
    @player = player
  end

  def is_number_valid?(number)
    number.to_i >= 1 && number.to_i <= 10
  end

  def is_letter_valid?(letter)
    range = ("a".."j").to_a
    range.include?(letter)
  end

  def only_get_valid_numbers
    number = @player.get_number_coordinate
    until is_number_valid?(number)
      @display.ask_for_number
      number = @player.get_number_coordinate
    end
    number
  end

end
