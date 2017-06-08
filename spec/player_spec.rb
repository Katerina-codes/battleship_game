require 'player'

describe Player do

  it "gets a number from a player" do
    input = StringIO.new("1")
    player = Player.new(input)
    expect(player.get_number_coordinate).to eq("1")
  end

  it "gets a letter from a player" do
    input = StringIO.new("A")
    player = Player.new(input)
    expect(player.get_letter_coordinate).to eq("a")
  end

  it "gets 1 unique coordinate" do
    input = StringIO.new("1\na")
    player = Player.new(input)
    expect(player.get_ships_coordinates).to eq([[1, "a"]])
  end

end
