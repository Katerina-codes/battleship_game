require_relative 'lib/game'
require_relative 'lib/display'
require_relative 'lib/grid'
require_relative 'lib/move_validator'

new_game = Game.new(Display.new, Player.new, Grid.new, MoveValidator.new, Converter.new)
grid_size = 10
number_of_coordinates = 17
new_game.game_flow(grid_size, number_of_coordinates)
