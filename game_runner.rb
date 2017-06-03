require_relative 'lib/game'
require_relative 'lib/display'
require_relative 'lib/grid'
require_relative 'lib/move_validator'

new_game = Game.new(Display.new, Player.new, Grid.new, MoveValidator.new)
new_game.game_flow(10)
