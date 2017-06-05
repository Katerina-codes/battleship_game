require_relative 'lib/game'
require_relative 'lib/display'
require_relative 'lib/grid'
require_relative 'lib/move_validator'

new_game = Game.new(Display.new, Player.new, Grid.new, MoveValidator.new)
grid_size = 10
ship_coordinates = [[1, 8], [1, 9], [5, 1], [5,  2], [5, 3], [7, 4], [8, 4], [9, 4], [3, 5], [3, 6], [3, 7], [3, 8], [0, 2], [1, 3], [2, 3], [3, 3], [4, 3], [2, 8], [2, 9], [5, 1], [5, 2], [5, 3]]
new_game.game_flow(grid_size, ship_coordinates)
