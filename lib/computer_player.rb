class ComputerPlayer

  def play_move(number_of_ship_coordinates, grid_size)
    ship_coordinates = []
    number_of_ship_coordinates.times do |move|
      move = [(0..grid_size - 1).to_a.sample, (0..grid_size - 1).to_a.sample]
      ship_coordinates = ship_coordinates.push(move)
    end
  ship_coordinates
  end

end
