require 'game'

describe Game do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new }
  let(:display) { Display.new(output, input) }
  let(:grid) { Grid.new }
  let(:move_validator) { MoveValidator.new }
  let(:player) { Player.new }
  let(:converter) { Converter.new }

  it "Returns true if move is present in the ship coordinates array" do
    game = new_game_instance(display)

    expect(game.ship_coordinates([5, 1], [[5, 1]])).to eq(true)
  end

  it "Returns false if move is not present in the ship coordinates array" do
    game = new_game_instance(display)

    expect(game.ship_coordinates([9, 1],[[9, 2]])).to eq(false)
  end

  def new_game_instance(display)
    Game.new(display, player, grid, move_validator, converter)
  end

end
