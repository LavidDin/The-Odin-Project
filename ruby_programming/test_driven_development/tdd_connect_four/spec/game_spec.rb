require 'game'
require 'board'

describe Game do
  describe ".initialize" do
    let(:g) {Game.new('X','O')}
    it 'initializes a Game class instance' do
      expect(g).to be_instance_of(Game)
    end
  end

  describe '#switch_turn' do
    let(:g) {Game.new}
    let(:player_one) {'○'}
    it 'changes the current player' do
      g.switch_turn
      expect(player_one).not_to be (g.current_player)
    end
  end
end