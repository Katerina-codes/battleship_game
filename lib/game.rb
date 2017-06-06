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

  def ship_coordinates(move, ship_coordinates)
    ship_coordinates.include?(move)
  end

  def new_move
    @display.ask_for_number
    x_coordinate = only_get_valid_numbers
    @display.ask_for_letter
    y_coordinate = only_get_valid_letters
    [x_coordinate, y_coordinate]
  end

  def game_flow(grid_size, ship_coordinates)
    converter = Converter.new
    grid = @grid.draw_grid(grid_size)
    mark = "X"
    past_moves = []
    coordinates_list = ship_coordinates.length
    @display.display_grid(grid_size)

    until coordinates_list == 0
      move = new_move
      x_coordinate = move[0]
      y_coordinate = move[1]

      if move_played_before?(move, past_moves)
        @display.display_repeated_move_error
      else
        past_moves.push(move)
        array_position_1 = converter.number_to_array_position(x_coordinate)
        array_position_2 = converter.letter_to_array_position(y_coordinate)
        move = [array_position_1, array_position_2]

        if ship_coordinates(move, ship_coordinates)
          coordinates_list -= 1
          latest_hit_grid = @grid.mark_ship_hit(grid, array_position_1, array_position_2)
          @display.display_lastest_grid(latest_hit_grid, grid_size)
        else
          latest_grid = @grid.mark_position(grid, array_position_1, array_position_2, mark)
          @display.display_lastest_grid(latest_grid, grid_size)
        end
      end
    end
    latest_hit_grid
  end

end
