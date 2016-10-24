require 'bridge'

describe Bridge do

  describe 'cards' do
    it 'has a deck of cards' do
      expect(subject).to respond_to(:cards)
    end
  end


end