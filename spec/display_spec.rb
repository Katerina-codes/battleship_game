require 'display'

describe Display do
  let(:output) { StringIO.new }
  let(:display) { Display.new(output) }

  it "displays grid of 1 by 1 with letter A" do
    grid = Grid.new
    converter = Converter.new
    display.display_grid(1, grid, converter)
    expect(output.string).to include(" A ", ".")
  end

  it "Asks the player for a number coordinate" do
    display.ask_for_number
    expect(output.string).to include("Time to make a move. Please enter a number from 1 - 10\n")
  end

  it "Asks the player for a letter" do
    display.ask_for_letter
    expect(output.string).to eq("Please enter a letter from A - J\n")
  end

  it "displays the newest version of the grid" do
    display.display_lastest_grid([["X"]], 1)
    expect(output.string).to include("A", "X")
  end

  it "displays 'This move has been entered before, enter another one!'" do
    display.display_repeated_move_error
    expect(output.string).to eq("This move has been entered before, enter another one!\n")
  end

end
