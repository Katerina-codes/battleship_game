require_relative 'display'
require_relative 'player'
require_relative 'grid'
require_relative 'converter'
require_relative 'move_validator'

class Game

  def initialize(display, player, grid, move_validator)
    @display = display
    @player = player
    @grid = grid
    @move_validator = move_validator
  end

  def only_get_valid_letters
    letter = @player.get_letter_coordinate
    until @move_validator.is_letter_valid?(letter)
      @display.ask_for_letter
      letter = @player.get_letter_coordinate
    end
    letter
  end

  def only_get_valid_numbers
    number = @player.get_number_coordinate
    until @move_validator.is_number_valid?(number)
      @display.ask_for_number
      number = @player.get_number_coordinate
    end
    number
  end

  def move_played_before?(move, past_moves)
    past_moves.include?(move)
  end

  def ship_coordinates(move)
    ships = [[2, "j"], [2, "k"], [6, "b"], [6, "c"], [6, "d"], [8, "e"], [9, "e"], [10, "e"], [4, "f"], [4, "g"], [4, "h"], [4, "i"], [1, "c"], [2, "c"], [3, "c"], [4, "c"], [5, "c"], [2, "j"], [2, "k"], [6, "b"], [6, "c"], [6, "d"]]
    ships.include?(move)
  end

  def game_flow(number)
    converter = Converter.new
    grid = @grid.draw_grid(number)
    mark = "X"
    past_moves = []
    ship_locations = 17


    @display.display_grid(number)
    @display.ask_for_number
    x_coordinate = only_get_valid_numbers
    @display.ask_for_letter
    y_coordinate = only_get_valid_letters

    move = [x_coordinate, y_coordinate]

    if move_played_before?(move, past_moves)
      game_flow(number)
    else
      past_moves.push(move)
      array_position_1 = converter.number_to_array_position(x_coordinate)
      array_position_2 = converter.letter_to_array_position(y_coordinate)
      latest_grid = @grid.mark_position(grid, array_position_1, array_position_2, mark)

      @display.display_lastest_grid(latest_grid, number)
  end
  end

end
