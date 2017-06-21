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

  def ship_coordinates(move, ship_coordinates)
    ship_coordinates.include?(move)
  end

  def mark_hit_or_miss(move, ship_coordinates, grid)
    number_coordinate = move[0]
    letter_coordinate = move[1]
    if ship_coordinates(move, ship_coordinates)
      latest_grid = @grid.mark_position(grid, number_coordinate, letter_coordinate, "/")
    else
      latest_grid = @grid.mark_position(grid, number_coordinate, letter_coordinate, "X")
    end
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
    move = new_move
    number_coordinate, letter_coordinate = move[0], move[1]

    if grid[number_coordinate][letter_coordinate] == "X" || grid[number_coordinate][letter_coordinate] == "/"
      @display.display_repeated_move_error
      play_until_winner_is_found(number_of_coordinates, grid, ship_coordinates, converter_instance, grid_size)
    else
      latest_grid = mark_hit_or_miss(move, ship_coordinates, grid)
      @display.display_lastest_grid(latest_grid, grid_size, converter_instance)
      latest_grid
    end
  end

  def count_ship_hits(players_latest_grid)
    number_of_hits_each_row = players_latest_grid.map do |element|
      element.count("/")
    end
    number_of_hits_each_row.reduce(:+)
  end

  def find_winner(p1_ship_hits, p2_ship_hits, number_of_coordinates, p1_grid, p2_grid)
    if p1_ship_hits == number_of_coordinates
      p1_grid
    else
      p2_grid
    end
  end

  def game_flow(grid_size, number_of_coordinates)
    mark = "X"
    computer = ComputerPlayer.new
    p1_grid = @grid.draw_grid(grid_size)
    p2_grid = @grid.draw_grid(grid_size)
    past_coordinates = []
    number_of_ship_coordinates = [5, 4, 3, 3, 2]

    5.times do |get_coordinates|
      number_of_coordinates_needed = number_of_ship_coordinates[-1]
      get_coordinates = @display.get_ships_coordinates(number_of_coordinates_needed, @converter, past_coordinates)
      p1_ship_coordinates = get_coordinates[0]
      past_coordinates += get_coordinates[1]
      p1_board = board_with_ship_coordinates(grid_size, p1_grid, p1_ship_coordinates, @converter, "O")
      number_of_ship_coordinates.pop
    end

    p2_ship_coordinates = computer.play_move(number_of_coordinates, grid_size)
    @display.display_lastest_grid(p2_grid, grid_size, @converter)
    p1_ship_hits, p2_ship_hits = 0

    until p1_ship_hits == number_of_coordinates || p2_ship_hits == number_of_coordinates
      p1_latest_grid = play_until_winner_is_found(number_of_coordinates, p2_grid, p2_ship_coordinates, @converter, grid_size)
      p1_ship_hits = count_ship_hits(p1_latest_grid)
      number_of_moves_needed = 1
      p2_move_in_array = computer.play_move(number_of_moves_needed, grid_size)
      p2_move = p2_move_in_array[0]
      letter_coordinate, number_coordinate = p2_move[0], p2_move[1]
      p2_latest_grid = mark_hit_or_miss(p2_move, p2_ship_coordinates, p1_grid)
      @display.display_lastest_grid(p2_latest_grid, grid_size, @converter)
      p2_ship_hits = count_ship_hits(p2_latest_grid)
     end
  find_winner(p1_ship_hits, p2_ship_hits, number_of_coordinates, p1_grid, p2_grid)
  end

end
