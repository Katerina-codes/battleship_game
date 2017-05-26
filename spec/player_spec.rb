require 'player'

describe Player do

  it "marks a move on a grid of 1" do
    player = Player.new
    expect(player.make_move([0][0],[["."]])).to eq([["x"]])
  end

  it "marks a move on a grid of 2" do
    player = Player.new
    expect(player.make_move([1][0],[["."], ["."]])).to eq([["."], ["x"]])
  end


end
