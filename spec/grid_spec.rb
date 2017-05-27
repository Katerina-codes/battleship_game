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

  it "draws letter A for grid of 1" do
    expect(subject.get_letters(1)).to eq(" A ")
  end

  it "draws letters A, B for grid of 2" do
    expect(subject.get_letters(2)).to eq(" A B ")
  end

  it "draws letters A - J for grid of 10" do
    expect(subject.get_letters(10)).to eq(" A B C D E F G H I J ")
  end


  it "marks a position on the grid" do
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
end
