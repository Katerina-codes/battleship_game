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

  def board_with_ship_coordinates(grid_size, grid, ship_coordinates, converter_instance, mark)
    ship_coordinates.map do |x, y|
      my_ships = @grid.mark_position(grid, x, y, mark)
      @display.display_lastest_grid(my_ships, grid_size, converter_instance)
      my_ships
    end
  end

  def play_until_winner_is_found(coordinates_list, grid, ship_coordinates, converter_instance, grid_size)
    past_moves = []
    #until coordinates_list == 0
      move = new_move
      number_coordinate = move[0]
      letter_coordinate = move[1]

      if move_played_before?(move, past_moves)
       p "should prompt for move again"
        @display.display_repeated_move_error
        play_until_winner_is_found(coordinates_list, grid, ship_coordinates, converter_instance, grid_size)
      else
        past_moves = past_moves.push(move)

        if ship_coordinates(move, ship_coordinates)
          coordinates_list -= 1
          latest_grid = @grid.mark_ship_hit(grid, number_coordinate, letter_coordinate)
          @display.display_lastest_grid(latest_grid, grid_size, converter_instance)
        else
          latest_grid = @grid.mark_position(grid, number_coordinate, letter_coordinate, "X")
          @display.display_lastest_grid(latest_grid, grid_size, converter_instance)
        end
      end
    latest_grid
  end

  def game_flow(grid_size, number_of_coordinates)
    grid_instance = @grid
    converter_instance = @converter
    mark = "X"
    past_moves = []
    coordinates_list = number_of_coordinates

    p1_grid = @grid.draw_grid(grid_size)
    p1_ship_coordinates = @display.get_ships_coordinates(number_of_coordinates, converter_instance)
    p1_board = board_with_ship_coordinates(grid_size, p1_grid, p1_ship_coordinates, converter_instance, "O")

    p2_grid = @grid.draw_grid(grid_size)
    p2_ship_coordinates = @display.get_ships_coordinates(number_of_coordinates, converter_instance)

      p2_grid = play_until_winner_is_found(coordinates_list, p2_grid, p2_ship_coordinates, converter_instance, grid_size)
      p1_grid = play_until_winner_is_found(coordinates_list, p1_grid, p1_ship_coordinates, converter_instance, grid_size)
  end
end
