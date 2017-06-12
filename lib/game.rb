require_relative 'display'
require_relative 'player'
require_relative 'grid'
require_relative 'converter'
require_relative 'move_validator'

class Game

  def initialize(display, player, grid, move_validator, converter)
    @display = display
    @player = player
    @grid = grid
    @move_validator = move_validator
    @converter = converter
  end

  def move_played_before?(move, past_moves)
    past_moves.include?(move)
  end

  def ship_coordinates(move, ship_coordinates)
    ship_coordinates.include?(move)
  end

  def new_move
    @display.ask_for_number
    x_coordinate = @display.only_get_valid_numbers(@move_validator)
    @display.ask_for_letter
    y_coordinate = @display.only_get_valid_letters(@move_validator)
    convert_move(x_coordinate, y_coordinate)
  end

  def convert_move(x_coordinate, y_coordinate)
    array_position_1 = @converter.number_to_array_position(x_coordinate)
    array_position_2 = @converter.letter_to_array_position(y_coordinate)
    [array_position_1, array_position_2]
  end

  def board_with_ship_coordinates(grid_size, grid, ship_coordinates, converter_instance)
    ship_coordinates.each do |x, y|
      my_ships = @grid.mark_position(grid, x, y, "O")
      @display.display_lastest_grid(my_ships, grid_size, converter_instance)
    end
  end

  def game_flow(grid_size, number_of_coordinates)
    grid_instance = @grid
    converter_instance = @converter
    grid = @grid.draw_grid(grid_size)
    mark = "X"
    past_moves = []
    coordinates_list = number_of_coordinates

    ship_coordinates = @display.get_ships_coordinates(number_of_coordinates, converter_instance)
    p1_initial_board = board_with_ship_coordinates(grid_size, grid, ship_coordinates, converter_instance)

    ship_coordinates = @display.get_ships_coordinates(number_of_coordinates, converter_instance)
    p2_initial_board = board_with_ship_coordinates(grid_size, grid, ship_coordinates, converter_instance)

    until coordinates_list == 0
      move = new_move
      number_coordinate = move[0]
      letter_coordinate = move[1]

      if move_played_before?(move, past_moves)
        @display.display_repeated_move_error
      else
        past_moves.push(move)

        if ship_coordinates(move, ship_coordinates)
          coordinates_list -= 1
          latest_hit_grid = @grid.mark_ship_hit(grid, number_coordinate, letter_coordinate)
          @display.display_lastest_grid(latest_hit_grid, grid_size, converter_instance)
        else
          latest_grid = @grid.mark_position(grid, number_coordinate, letter_coordinate, mark)
          @display.display_lastest_grid(latest_grid, grid_size, converter_instance)
        end
      end
    end
    latest_hit_grid
  end

end
