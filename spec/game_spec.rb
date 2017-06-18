require 'game'

describe Game do
  let(:output) { StringIO.new }
  let(:input) { StringIO.new }
  let(:display) { Display.new(output, input) }
  let(:grid) { Grid.new }
  let(:move_validator) { MoveValidator.new }
  let(:player) { Player.new }
  let(:converter) { Converter.new }

  it "Displays the grid and letter to the player" do
    input = StringIO.new("1\na\n1\nb\n1\nb\n1\na")
    display = Display.new(output, input)
    game = new_game_instance(display)
    grid_size = 1
    ship_coordinates = 1

    game.game_flow(grid_size, ship_coordinates)

    expect(output.string).to include(" A ", ".")
  end

  it "Updates the grid with a marked position" do
    input = StringIO.new("1\nb\n1\na\n1\nb\n2\na\n2\nb")
    display = Display.new(output, input)
    game = new_game_instance(display)
    grid_size = 2
    number_of_coordinates = 1

    game.game_flow(grid_size, number_of_coordinates)

    expect(output.string).to include("A", "B", "1", "2", ".", ".", "/", "X")
  end

  it "Returns true if move is present in the ship coordinates array" do
    game = new_game_instance(display)

    expect(game.ship_coordinates([5, 1], [[5, 1]])).to eq(true)
  end

    it "Returns false if move is not present in the ship coordinates array" do
      game = new_game_instance(display)

      expect(game.ship_coordinates([9, 1],[[9, 2]])).to eq(false)
    end

    # it "marks ships and normal positions on the grid" do
    #   input = StringIO.new("1\na\n1\na\n1\na\n1\nb\n2\na\n2\nb")
    #   display = Display.new(output, input)
    #   game = new_game_instance(display)
    #   grid_size = 1
    #   number_of_coordinates = 1
    #
    #   expect(game.game_flow(grid_size, number_of_coordinates)).to include("/", "/", "X", ".")
    # end

    def new_game_instance(display)
      Game.new(display, player, grid, move_validator, converter)
    end

end
