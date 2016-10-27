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

      describe 'washing' do
        context 'no need to wash, that is 4 points and above' do
          it 'doesnt wash' do
            card1 = double :card, :value => 10, :suit => :spades
            card2 = double :card, :value => 10, :suit => :clubs
            card3 = double :card, :value => 10, :suit => :diamonds
            card4 = double :card, :value => 10, :suit => :hearts
            card5 = double :card, :value => 9, :suit => :spades
            card6 = double :card, :value => 9, :suit => :clubs
            card7 = double :card, :value => 9, :suit => :diamonds
            card8 = double :card, :value => 9, :suit => :hearts
            card9 = double :card, :value => 8, :suit => :spades
            card10 = double :card, :value => 8, :suit => :clubs
            card11 = double :card, :value => 8, :suit => :diamonds
            card12 = double :card, :value => 8, :suit => :hearts
            card13 = double :card, :value => 7, :suit => :spades
            subject.players[0].hand = [
              card1,
              card2,
              card3,
              card4,
              card5,
              card6,
              card7,
              card8,
              card9,
              card10,
              card11,
              card12,
              card13,
            ]
            expect(subject.wash?).to eq false
          end
        end
      end
    end
  end


end