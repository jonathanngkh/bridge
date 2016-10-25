require 'bridge'

describe Bridge do

  describe 'cards' do
    it 'has a deck of cards' do
      expect(subject).to respond_to(:cards)
    end

    # it 'is all the cards' do
    #   expect(subject.cards).to
    # end
  end


end