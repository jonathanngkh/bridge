require 'player'

describe Player do
  it 'has a hand' do
    expect(subject).to respond_to(:hand)
  end

  it 'has a bid' do
    expect(subject).to respond_to(:bid)
  end

  it 'has a playing_card' do
    expect(subject).to respond_to(:playing_card)
  end

  it 'holds sets that it won' do
    expect(subject).to respond_to(:sets_won)
  end

  it 'can place bid for a level and its suit' do
    expect{ subject.bid_for(1, :spades) }.to change { subject.bid }.from([]).to([1, :spades])
  end

  describe 'bid logic' do
    before do
      subject.bid_for(level, :spades)
    end

    context do
      let(:level) { 1 }
      it 'knows that level 1 is 7-7' do
        expect(subject.sets_to_win).to eq 7
        expect(subject.sets_to_lose).to eq 7
      end
    end

    context do
      let(:level) { 2 }
      it 'knows that level 1 is 8-6' do
        expect(subject.sets_to_win).to eq 8
        expect(subject.sets_to_lose).to eq 6
      end
    end

    context do
      let(:level) { 3 }
      it 'knows that level 1 is 9-5' do
        expect(subject.sets_to_win).to eq 9
        expect(subject.sets_to_lose).to eq 5
      end
    end

    context do
      let(:level) { 4 }
      it 'knows that level 1 is 10-4' do
        expect(subject.sets_to_win).to eq 10
        expect(subject.sets_to_lose).to eq 4
      end
    end

    context do
      let(:level) { 5 }
      it 'knows that level 1 is 11-3' do
        expect(subject.sets_to_win).to eq 11
        expect(subject.sets_to_lose).to eq 3
      end
    end

    context do
      let(:level) { 6 }
      it 'knows that level 1 is 12-2' do
        expect(subject.sets_to_win).to eq 12
        expect(subject.sets_to_lose).to eq 2
      end
    end

    context do
      let(:level) { 7 }
      it 'knows that level 1 is 13-1' do
        expect(subject.sets_to_win).to eq 13
        expect(subject.sets_to_lose).to eq 1
      end
    end

    context do
      let(:level) { 8 }
      it 'knows that level 1 is 14-0' do
        expect(subject.sets_to_win).to eq 14
        expect(subject.sets_to_lose).to eq 0
      end
    end
  end

  describe 'wash logic' do
    it 'has wash_points' do
      expect(subject).to respond_to(:wash_points)
    end
  end

  it 'notifies itself of the number of sets that need to be won upon bidding' do
    expect(subject.bid_for(1, :spades)).to eq "You will need to win 7 sets while the opponent will need 7."
  end

  it 'can choose a card to play' do
    expect{ subject.play(subject.hand[0]) }.to change { subject.playing_card }.from([]).to(subject.hand[0])
  end
end