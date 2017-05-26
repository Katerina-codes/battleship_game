require 'display'

describe Display do

  it "displays grid of 1 by 1 with letter A" do
    output = StringIO.new
    display = Display.new(output)
    display.display_grid(1)
    expect(output.string).to include(" A ", ".")
  end

end
