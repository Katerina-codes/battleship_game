require 'grid'

describe Grid do
  let(:Grid) { Grid.new }

  it "draws a grid thats 1 by 1" do
    expect(subject.draw_grid(1)).to eq([["."]])
  end

  it "draws a grid thats 2 by 2" do
    expect(subject.draw_grid(2)).to eq(
[[".", "."],
[".", "."]])
  end

  it "marks first position on the grid" do
    grid = subject.draw_grid(2)
    x_coordinate = 0
    y_coordinate = 0
    mark = "X"

    new_grid = subject.mark_position(
                    grid,
                    x_coordinate,
                    y_coordinate,
                    mark
                  )

    expect(new_grid).to eq([["X", "."], [".", "."]])
  end

  it "marks second position on the grid" do
    grid = subject.draw_grid(2)
    x_coordinate = 0
    y_coordinate = 1
    mark = "X"

    new_grid = subject.mark_position(
                    grid,
                    x_coordinate,
                    y_coordinate,
                    mark
                  )

    expect(new_grid).to eq([[".", "X"], [".", "."]])
  end

  it "checks if a position has been made before" do
    expect(subject.is_mark_position_unique?([0, 0])).to eq(false)
  end

  it "marks a ship hit on the grid" do
    grid = subject.draw_grid(1)
    x_coordinate = 0
    y_coordinate = 0

    new_grid = subject.mark_position(
                    grid,
                    x_coordinate,
                    y_coordinate,
                    "/"
                  )

    expect(new_grid).to eq([["/"]])
  end

  it "marks another ship hit on the grid" do
    grid = subject.draw_grid(1)
    x_coordinate = 0
    y_coordinate = 1

    new_grid = subject.mark_position(
                    grid,
                    x_coordinate,
                    y_coordinate,
                    "/"
                  )

    expect(new_grid).to eq([[".", "/"]])
  end

end
