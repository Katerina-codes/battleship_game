require 'computer_player'

describe ComputerPlayer do

  it "returns [0, 0] if passed [0, 0]" do
    computer = ComputerPlayer.new([0, 0])
    expect(computer.play_move(1)).to eq([[0, 0]])
  end

  it "returns a random move if no move is passed" do
    computer = ComputerPlayer.new
    p array_returned = computer.play_move(2)
    valid_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    puts x = array_returned[0][0]
    puts y = array_returned[0][1]

    expect(valid_numbers.include?(x)).to eq(true)
    expect(valid_numbers.include?(y)).to eq(true)
  end

  # it "returns 2 coordinates if 2 are needed" do
  #   computer = ComputerPlayer.new
  #   expect(computer.play_move(2)).to eq([[0, 0], [0, 1]])
  # end

end
