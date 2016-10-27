require 'bridge'

describe Bridge do

  describe 'cards' do
    it 'has a deck of cards' do
      expect(subject).to respond_to(:cards)
    end
  end

  describe 'players' do
    it 'has players' do
      expect(subject).to respond_to(:players)
    end

    it 'has 4 players' do
      expect(subject.players.count).to eq 4
    end

    describe 'dealing' do
      before do
        subject.deal
      end

      it 'gives these players 13 cards each' do
        expect(subject.players[0].hand.count).to eq 13
        expect(subject.players[1].hand.count).to eq 13
        expect(subject.players[2].hand.count).to eq 13
        expect(subject.players[3].hand.count).to eq 13
      end

      context 'washing' do
        # it 'knows the wash logic' do
        #   subject.players[0].hand.each do |card|
        #     card.value
        #   end

        # end
      end
    end
  end


end