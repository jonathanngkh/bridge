require 'deck_master'

describe Deck_Master do
  it 'holds cards in deck_deck' do
    expect(subject).to respond_to(:deck_deck)
  end

  it 's deck_deck contains 52 items' do
    expect(subject.deck_deck.count).to eq 52
  end

  it 's cards are randomized as in not in increasing order' do
    first_four_cards_plus_minus_plus_minus = subject.deck_deck[0].value - subject.deck_deck[1].value + subject.deck_deck[2].value - subject.deck_deck[3].value
    expect(first_four_cards_plus_minus_plus_minus).not_to eq 0
  end

  it 's #give_card_to(player) can give away a card to a target player' do
    player = double :player, :hand => []
    expect{ subject.give_card_to(player) }.to change{ subject.deck_deck.count }.from(52).to(51)
  end
end
