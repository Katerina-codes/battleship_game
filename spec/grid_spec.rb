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

end
