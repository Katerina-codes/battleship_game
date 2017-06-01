require 'game'

describe Game do

  it "Displays the grid and letter to the player" do
    output = StringIO.new
    display = Display.new(output)
    player = Player.new
    grid = Grid.new
    game = Game.new(display, player, grid)
    grid_size = 3

    game.game_flow(grid_size)

    expect(output.string).to include(" A ", ".")
  end

  it "Updates the grid with a marked position" do
    input = StringIO.new("2\nB\n2\nB\b2\nB")
    output = StringIO.new
    display = Display.new(output)
    player = Player.new(input)
    grid = Grid.new
    game = Game.new(display, player, grid)
    grid_size = 2

    game.game_flow(grid_size)

    expect(output.string).to include("A", "B", "1", "2", ".", ".", ".", "X")
  end

  it "prompts for a number until it's in the range of 1 - 10" do
    input = StringIO.new("11\n3")
    output = StringIO.new
    display = Display.new(output)
    player = Player.new(input)
    grid = Grid.new

    game = Game.new(display, player, grid)

    game.only_get_valid_numbers

    expect(output.string).to eq("Time to make a move. Please enter a number from 1 - 10\n")
  end

  it "returns the number if a valid number is entered" do
    input = StringIO.new("1")
    output = StringIO.new
    display = Display.new(output)
    player = Player.new(input)
    grid = Grid.new

    game = Game.new(display, player, grid)

    expect(game.only_get_valid_numbers).to eq("1")
  end

end
