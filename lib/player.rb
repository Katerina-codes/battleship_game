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

end
