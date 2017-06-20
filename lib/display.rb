class Display

  def initialize(output = $stdout, input = $stdin)
    @output = output
    @input = input
  end

  def display_grid(grid_size, grid_instance, converter_instance)
    letters = converter_instance.number_to_letters(grid_size)
    grid = grid_instance.draw_grid(grid_size)

    @output.puts letters
    formatted_grid = grid.map do |row|
      row.join(" ") + "\n"
    end

    final_grid = formatted_grid.each_with_index.map do |row, index|
      @output.print (index + 1).to_s + " ", row
    end
  end

    def ask_for_number
      @output.puts "Time to make a move. Please enter a number from 1 - 10"
    end

    def ask_for_letter
      @output.puts "Please enter a letter from A - J"
    end

    def display_repeated_move_error
      @output.puts "This move has been entered before, enter another one!"
    end

    def display_place_ships_message
      @output.puts "Please place your ships in preparation for battle"
    end

    def display_lastest_grid(grid, number, converter_instance)

      letters = converter_instance.number_to_letters(number)
      @output.puts letters

      formatted_grid = grid.map do |row|
        row.join(" ") + "\n"
      end

      final_grid = formatted_grid.each_with_index.map do |row, index|
        @output.print (index + 1).to_s + " ", row
      end
    end

    def get_number_coordinate
      @input.gets.chomp
    end

    def get_letter_coordinate
      @input.gets.chomp.downcase
    end

    def check_if_coordinate_is_duplicate(number, ship, past_coordinates)
      if !past_coordinates.include?(ship)
        coordinates.push(ship)
        past_coordinates.push(ship)
      else
        @output.puts "You have entered this coordinate already"
        get_ships_coordinates(number, converter_instance, (past_coordinates + coordinates))
      end
    end

    def get_ships_coordinates(number, converter_instance, past_coordinates)
      move_validator_instance = MoveValidator.new
      coordinates = []

      until number == 0
        @output.puts "Please enter a number coordinate from 1-10 for your ship"
        number_coordinate = only_get_valid_numbers(move_validator_instance)
        @output.puts "Please enter a letter coordinate from A-J for your ship"
        letter_coordinate = only_get_valid_letters(move_validator_instance)

        converted_number_coord = converter_instance.number_to_array_position(number_coordinate)
        converted_letter_coord = converter_instance.letter_to_array_position(letter_coordinate)
        ship = [converted_number_coord, converted_letter_coord]

        if !past_coordinates.include?(ship)
          coordinates.push(ship)
          past_coordinates.push(ship)
          latest_number = (number -= 1)
        else
          @output.puts "You have entered this coordinate already"
          get_ships_coordinates(latest_number, converter_instance, (past_coordinates + coordinates))
        end
      end
      [coordinates, past_coordinates]
    end

    def only_get_valid_letters(move_validator_instance)
      letter = get_letter_coordinate
      until move_validator_instance.is_letter_valid?(letter)
        ask_for_letter
        letter = get_letter_coordinate
      end
      letter
    end

    def only_get_valid_numbers(move_validator_instance)
      number = get_number_coordinate
      until move_validator_instance.is_number_valid?(number)
        ask_for_number
        number = get_number_coordinate
      end
      number
    end

end
