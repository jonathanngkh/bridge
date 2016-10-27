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

  it 'can place bid for a suit' do
    expect{ subject.bid_for(:spades) }.to change { subject.bid }.from([]).to(:spades)
  end

  it 'can choose a card to play' do
    expect{ subject.play(subject.hand[0]) }.to change { subject.playing_card }.from([]).to(subject.hand[0])
  end
end