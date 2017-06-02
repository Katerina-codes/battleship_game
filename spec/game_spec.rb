require 'game'

describe Game do

  it "Displays the grid and letter to the player" do
    input = StringIO.new("3\nd")
    output = StringIO.new
    display = Display.new(output)
    player = Player.new(input)
    grid = Grid.new
    move_validator = MoveValidator.new(display, player)
    game = Game.new(display, player, grid, move_validator)
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
    move_validator = MoveValidator.new(display, player)
    game = Game.new(display, player, grid, move_validator)
    grid_size = 2

    game.game_flow(grid_size)

    expect(output.string).to include("A", "B", "1", "2", ".", ".", ".", "X")
  end

  it "prompts for a letter until it's in the range of A - J" do
    input = StringIO.new("K\na")
    output = StringIO.new
    display = Display.new(output)
    player = Player.new(input)
    grid = Grid.new
    move_validator = MoveValidator.new(display, player)
    game = Game.new(display, player, grid, move_validator)

    game.only_get_valid_letters

    expect(output.string).to eq("Please enter a letter from A - J\n")
  end

  it "returns the letter if it's inside the range" do
    input = StringIO.new("a")
    output = StringIO.new
    display = Display.new(output)
    player = Player.new(input)
    grid = Grid.new
    move_validator = MoveValidator.new(display, player)
    game = Game.new(display, player, grid, move_validator)

    expect(game.only_get_valid_letters).to eq("a")
  end

  it "Returns true if move has been played before" do
    output = StringIO.new
    display = Display.new(output)
    player = Player.new
    grid = Grid.new
    move_validator = MoveValidator.new(display, player)
    game = Game.new(display, player, grid, move_validator)
    past_moves = [["1", "a"]]
    move = ["1", "a"]

    expect(game.move_played_before?(move, past_moves)).to eq(true)
  end

  it "Returns false if move hasn't been played before" do
    output = StringIO.new
    display = Display.new(output)
    player = Player.new
    grid = Grid.new
    move_validator = MoveValidator.new(display, player)
    game = Game.new(display, player, grid, move_validator)
    past_moves = [["1", "a"]]
    move = ["1", "b"]

    expect(game.move_played_before?(move, past_moves)).to eq(false)
  end

end
