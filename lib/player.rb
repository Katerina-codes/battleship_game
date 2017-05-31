class Player

  def initialize(input = $stdin)
    @input = input
  end

  def get_number_coordinate
    @input.gets.chomp
  end

  def is_number_valid?(number)
    if number.to_i >= 1 && number.to_i <= 10
      true
    else
      false
    end
  end

  def get_letter_coordinate
    @input.gets.chomp.downcase
  end

  def is_letter_valid?(letter)
    if letter == "a"
      true
    else
      false
    end
  end

end
