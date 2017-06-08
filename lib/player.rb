class Player

  def initialize(input = $stdin)
    @input = input
  end

  def get_number_coordinate
    @input.gets.chomp
  end

  def get_letter_coordinate
    @input.gets.chomp.downcase
  end

  def get_ships_coordinates
    number_coordinate = @input.gets.chomp.to_i
    letter_coordinate = @input.gets.chomp
    [[number_coordinate, letter_coordinate]]
  end

end
