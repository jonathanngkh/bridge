require 'deck_master'

describe Deck_Master do
  it 'holds cards in deck_hash' do
    expect(subject).to respond_to(:deck_deck)
  end

  it 's deck_deck contains 52 items' do
    expect(subject.deck_deck.count).to eq 52
  end

  it 's #give_card_to(player) can give away a card to a target player' do
    player = double :player, :cards => []
    # subject.give_card_to(player)
    expect{ subject.give_card_to(player) }.to change { subject.deck_deck.count }.from(52).to(51)
    # expect(subject.deck_hash.count).to eq 51
  end
end
