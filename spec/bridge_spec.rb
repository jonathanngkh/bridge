require 'bridge'

describe Bridge do

  describe 'cards' do
    it 'has a deck of cards' do
      expect(subject).to respond_to(:cards)
    end
  end

  describe 'players' do
    it 'has 4 players' do
      expect(subject).to respond_to(:players)
    end
  end


end