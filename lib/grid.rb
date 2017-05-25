class Grid

  def draw_grid(number)
    board = Array.new(number, ".")

    x = 0
    grid_number = 1
    
    until x == number
      print "\t"
      if grid_number <= 9
        print " "
        print grid_number
        print "  "
      else
        print grid_number
        print "  "
      end
    print board
    puts "\n"
    x += 1
    grid_number += 1
  end


    # if number == 1
    #   "."
    # elsif number == 2
    #   """. .\n. ."""
    # else
    #   """. . .\n. . ."""
    # end
  end

end
