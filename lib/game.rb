require_relative 'display'
require_relative 'player'
require_relative 'grid'
require_relative 'converter'

class Game

  def initialize(display, player, grid)
    @display = display
    @player = player
    @grid = grid
  end

  def only_get_valid_numbers
    number = @player.get_number_coordinate
    until @player.is_number_valid?(number)
      @display.ask_for_number
      number = @player.get_number_coordinate
    end
    number
  end

  def only_get_valid_letters
    letter = @player.get_letter_coordinate
    until @player.is_letter_valid?(letter)
      @display.ask_for_letter
      letter = @player.get_letter_coordinate
    end
    letter
  end

  def move_played_before?(move, past_moves)
    true
  end

  def game_flow(number)
    converter = Converter.new
    converter.number_to_letters(number)
    grid = @grid.draw_grid(number)
    mark = "X"

    @display.display_grid(number)
    @display.ask_for_number
    x_coordinate = only_get_valid_numbers
    @display.ask_for_letter
    y_coordinate = only_get_valid_letters
    array_position_1 = converter.number_to_array_position(x_coordinate)
    array_position_2 = converter.letter_to_array_position(y_coordinate)
    latest_grid = @grid.mark_position(grid, array_position_1, array_position_2, mark)
    @display.display_lastest_grid(latest_grid, number)
  end

end
