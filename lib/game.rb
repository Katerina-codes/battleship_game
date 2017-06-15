require_relative 'display'
require_relative 'player'
require_relative 'grid'
require_relative 'converter'
require_relative 'move_validator'
require_relative 'computer_player'

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
    my_ships = nil
    ship_coordinates.map do |x, y|
      my_ships = @grid.mark_position(grid, x, y, mark)
    end
    @display.display_lastest_grid(my_ships, grid_size, converter_instance)
  end

  def play_until_winner_is_found(number_of_coordinates, grid, ship_coordinates, converter_instance, grid_size)
    past_moves = []
    move = new_move
    number_coordinate = move[0]
    letter_coordinate = move[1]

    if ship_coordinates(move, ship_coordinates)
      latest_grid = @grid.mark_position(grid, number_coordinate, letter_coordinate, "/")
      @display.display_lastest_grid(latest_grid, grid_size, converter_instance)
    else
      latest_grid = @grid.mark_position(grid, number_coordinate, letter_coordinate, "X")
      @display.display_lastest_grid(latest_grid, grid_size, converter_instance)
    end
    latest_grid
  end

  def game_flow(grid_size, number_of_coordinates)
    grid_instance = @grid
    converter_instance = @converter
    mark = "X"
    past_moves = []
    computer = ComputerPlayer.new

    p1_grid = @grid.draw_grid(grid_size)
    p1_ship_coordinates = @display.get_ships_coordinates(number_of_coordinates, converter_instance)
    p1_board = board_with_ship_coordinates(grid_size, p1_grid, p1_ship_coordinates, converter_instance, "O")

    p2_grid = @grid.draw_grid(grid_size)
    p2_ship_coordinates = computer.play_move(number_of_coordinates, grid_size)
    @display.display_lastest_grid(p2_grid, grid_size, converter_instance)

    p1_ship_hits = 0
    p2_ship_hits = 0

    until p1_ship_hits == number_of_coordinates || p2_ship_hits == number_of_coordinates
      p2_grid = play_until_winner_is_found(number_of_coordinates, p2_grid, p2_ship_coordinates, converter_instance, grid_size)
      p1_array_of_hits = p2_grid.map do |element|
        element.count("/")
      end
      p1_ship_hits = p1_array_of_hits.reduce(:+)

      p2_move = computer.play_move(1, grid_size)
      letter_coordinate = p2_move[0][0]
      number_coordinate = p2_move[0][1]

      if ship_coordinates(p2_move, p2_ship_coordinates)
        latest_grid = @grid.mark_position(p1_grid, number_coordinate, letter_coordinate, "/")
      else
        latest_grid = @grid.mark_position(p1_grid, number_coordinate, letter_coordinate, "X")
      end

      @display.display_lastest_grid(latest_grid, grid_size, converter_instance)

      p1_grid = latest_grid
      p2_array_of_hits = p1_grid.map do |element|
        element.count("/")
      end
      p2_ship_hits = p2_array_of_hits.reduce(:+)
    end

    if p1_ship_hits == number_of_coordinates
      p1_grid
    else
      p2_grid
    end
  end
end
