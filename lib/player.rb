class Player

  def initialize(input = $stdin)
    @input = input
  end

  def get_number_coordinate
    @input.gets.chomp
  end

  def is_number_valid?(number)
    if number == 1
      true
    else
      false
    end
  end

  def get_letter_coordinate
    @input.gets.chomp.downcase
  end

end
