require 'converter'

describe Converter do

    it "draws letter A for grid of 1" do
      expect(subject.number_to_letters(1)).to eq("  A ")
    end

    it "draws letters A, B for grid of 2" do
      expect(subject.number_to_letters(2)).to eq("  A B ")
    end

    it "draws letters A - J for grid of 10" do
      expect(subject.number_to_letters(10)).to eq("  A B C D E F G H I J ")
    end

    it "converts number 1 to array position 0" do
      expect(subject.number_to_array_position(1)).to eq(0)
    end

    it "converts number 2 to array position 1" do
      expect(subject.number_to_array_position(2)).to eq(1)
    end

    it "converts number 3 to array position 2" do
      expect(subject.number_to_array_position(3)).to eq(2)
    end

    it "converts number 10 to array position 9" do
      expect(subject.number_to_array_position(10)).to eq(9)
    end

end
