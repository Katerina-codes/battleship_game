require 'player'

describe Player do

  it "gets a move from a player" do
    input = StringIO.new("1")
    player = Player.new(input)
    expect(player.get_number_coordinate).to eq("1")
  end

end
