require 'player'

describe Player do

  it "gets a move from a player" do
    input = StringIO.new("A\n")
    player = Player.new(input)
    expect(player.get_coordinate).to eq("A")
  end

end
