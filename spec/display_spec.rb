require 'display'

describe Display do

  it "displays grid of 1 by 1 with letter A" do
    output = StringIO.new
    display = Display.new(output)
    display.display_grid(1)
    expect(output.string).to include(" A ", ".")
  end

  it "Asks the player for a number coordinate" do
    output = StringIO.new
    display = Display.new(output)
    display.ask_for_number
    expect(output.string).to eq("Time to make a move. Please enter a number from 1 - 10\n")
  end

  it "Asks the player for a letter" do
    output = StringIO.new
    display = Display.new(output)
    display.ask_for_letter
    expect(output.string).to eq("Please enter a letter from A - J\n")
  end

end
