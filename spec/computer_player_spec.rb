require 'computer_player'

describe ComputerPlayer do

  # it "returns [0, 0] if passed [0, 0]" do
  #   grid_size = 1
  #   computer = ComputerPlayer.new([0, 0])
  #   expect(computer.play_move(1, grid_size)).to eq([[0, 0]])
  # end

  it "returns a random move if no move is passed" do
    grid_size = 2
    computer = ComputerPlayer.new
    ship_coordinates = computer.play_move(2, grid_size)
    valid_numbers = (0..grid_size).to_a
    x_coordinate = ship_coordinates[0][0]
    y_coordinate = ship_coordinates[0][1]

    expect(valid_numbers.include?(x_coordinate)).to eq(true)
    expect(valid_numbers.include?(y_coordinate)).to eq(true)
  end

  it "returns array of 2 arrays if 2 coordinates are needed" do
    grid_size = 2
    computer = ComputerPlayer.new
    ship_coordinates = computer.play_move(3, grid_size)
    expect(ship_coordinates.length).to eq(3)
  end

end
