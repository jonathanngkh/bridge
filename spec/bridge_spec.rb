require 'bridge'

describe Bridge do

  describe 'cards' do
    it 'has a deck of cards' do
      expect(subject).to respond_to(:cards)
    end
  end

  describe 'gameplay' do
    it 'knows the rank order' do
      expect(subject.rank).to eq({:pass=> 0, :clubs=>1, :diamonds=>2, :hearts=>3, :spades=>4, :notrump => 5})
    end
    context 'bidding' do
      it 'has a current bid' do
        expect(subject).to respond_to(:current_bid)
      end

      describe '#change_current_bid_to(players_bid)' do
        it 'changes current_bid to player\'s bid' do
          subject.players[0].bid = [1, :spades]
          expect{ subject.change_current_bid_to(subject.players[0].bid) }.to change{ subject.current_bid }.from([0, :clubs]).to([1, :spades])
        end

        context 'within the same level' do
          before do
            subject.current_bid = [1, :diamonds]
          end

          it 'doesnt allow smaller bids by suit' do
            expect{ subject.change_current_bid_to([1, :clubs]) }.not_to change{ subject.current_bid }
          end

          it 'allows bigger bids by suit' do
            expect{ subject.change_current_bid_to([1, :hearts]) }.to change{ subject.current_bid }.from([1, :diamonds]).to([1, :hearts])
          end

          it 'doesnt allow the same bid' do
            expect{ subject.change_current_bid_to([1, :diamonds]) }.not_to change{ subject.current_bid }
            expect(subject.change_current_bid_to([1, :diamonds])).to eq "You can only make a higher bid"
          end
        end

        context 'between different levels' do
          before do
            subject.current_bid = [2, :spades]
          end
          it 'resolves with higher level, regardless of suit' do
            expect{ subject.change_current_bid_to([3, :clubs]) }.to change { subject.current_bid }.from([2, :spades]).to([3, :clubs])
          end

          it 'doesnt allow lower level to win bid' do
            expect{ subject.change_current_bid_to([1, :spades]) }.not_to change{ subject.current_bid }
            expect(subject.change_current_bid_to([1, :spades])).to eq "You can only make a higher bid"
          end
        end

        context 'bidding resolution' do
          it 'allows the players to pass on bidding' do
            expect(subject.change_current_bid_to([0, :pass])).to eq :pass
          end
        end
      end
    end

    context 'team resolution' do
      it 'places winner of bid and holder of partner card on same team' do

      end
    end

    context 'set resolution' do
      it 'has a set holder' do

      end

      it 'gives the set to the owner of the highest card' do

      end

      describe 'determining set winner' do
        context 'same suit' do

        end

        context 'different suits, no trump setting' do

        end

        context 'different suits, trump setting' do

        end
      end
    end


    context 'win loss' do

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
      it 'gives these players 13 cards each' do
        subject.deal
        expect(subject.players[0].hand.count).to eq 13
        expect(subject.players[1].hand.count).to eq 13
        expect(subject.players[2].hand.count).to eq 13
        expect(subject.players[3].hand.count).to eq 13
      end

      it 'checks to wash after dealing and washes if needed' do
      end

      describe 'wash logic: wash_points < 4' do
        context 'only number cards' do
          it 'wash_points = 0' do
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
            expect(subject.wash?).to eq true
          end

          it 'wash_points = 3' do
            card1 = double :card, :value =>10, :suit => :spades
            card2 = double :card, :value => 2, :suit => :spades
            card3 = double :card, :value => 3, :suit => :spades
            card4 = double :card, :value => 4, :suit => :spades
            card5 = double :card, :value => 9, :suit => :spades
            card6 = double :card, :value => 5, :suit => :clubs
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
            expect(subject.wash?).to eq true
          end
        end

        context 'with face cards, 3 jacks' do
          it 'wash_points = 3' do
            card1 = double :card, :value =>11, :suit => :spades
            card2 = double :card, :value => 11, :suit => :clubs
            card3 = double :card, :value => 11, :suit => :diamonds
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
            expect(subject.wash?).to eq true
          end
        end
      end

      describe 'not washing logic: wash_points >= 4' do
        context 'face cards' do
          it '1 ace' do
            card1 = double :card, :value =>14, :suit => :spades
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

          it '1 king 1 queen' do
            card1 = double :card, :value =>13, :suit => :spades
            card2 = double :card, :value => 12, :suit => :clubs
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

          it '4 jacks' do
            card1 = double :card, :value =>11, :suit => :spades
            card2 = double :card, :value => 11, :suit => :clubs
            card3 = double :card, :value => 11, :suit => :diamonds
            card4 = double :card, :value => 11, :suit => :hearts
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

        context 'same suit number cards' do
          it '8 spades' do
            card1 = double :card, :value =>10, :suit => :spades
            card2 = double :card, :value => 2, :suit => :spades
            card3 = double :card, :value => 3, :suit => :spades
            card4 = double :card, :value => 4, :suit => :spades
            card5 = double :card, :value => 9, :suit => :spades
            card6 = double :card, :value => 5, :suit => :spades
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

      describe '#wash' do
        it 'resets the players on wash' do
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
          subject.wash
          expect(subject.players[0].hand).to eq []
        end

        it 'resets the deck on wash' do
          subject.wash
          expect(subject.cards.deck_deck).not_to eq []
        end
      end
    end
  end
end