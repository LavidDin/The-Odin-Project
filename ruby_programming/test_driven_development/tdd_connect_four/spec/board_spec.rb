require 'board'

describe Board do
  b = Board.new()

  describe "#initialize" do
    it "creates a 6 x 7 empty grid" do
      expect(b.grid).to be_a(Array)
      expect(b.grid.length).to eq(6)
      expect(b.grid[0].length).to eq(7)
    end
  end

  describe "#place_mark" do
    it "places a mark into a position on the board" do
      expect do
        b.place_mark(0, '○')
        (b.grid[6][0]).to eq('○')
      end
    end
  end

  describe "#empty_col?" do
    b.place_mark(0, '○')
    b.place_mark(0, '○')
    b.place_mark(0, '○')
    b.place_mark(0, '○')
    b.place_mark(0, '○')
    b.place_mark(0, '○')
    it "returns true if the specified column is empty" do
      expect(b.empty_col?(1)).to be true
    end
    it "returns false if the specified column is empty" do
      expect(b.empty_col?(0)).to be false
    end
  end
=begin
  describe "#win?"
    it "returns false if a row, diagonal or column is filled with player mark" do
      expect(b.win?('O')).to be_false
    end
    it "returns true if a row, diagonal or column is filled with player mark" do
      expect(b.win?('X')).to be_true
    end
  end
=end
end