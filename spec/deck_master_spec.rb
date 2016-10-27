require 'deck_master'

describe Deck_Master do
  it 'holds cards in deck_deck' do
    expect(subject).to respond_to(:deck_deck)
  end

  it 's deck_deck contains 52 items' do
    expect(subject.deck_deck.count).to eq 52
  end

  it 's cards are randomized as in not in increasing order' do
     ordered_values_array = [subject.deck_deck[0].value, subject.deck_deck[1].value, subject.deck_deck[2].value, subject.deck_deck[3].value, subject.deck_deck[4].value, subject.deck_deck[5].value, subject.deck_deck[6].value, subject.deck_deck[7].value, subject.deck_deck[8].value, subject.deck_deck[9].value, subject.deck_deck[10].value]
    expect(ordered_values_array).not_to eq [2,2,2,2,3,3,3,3,4,4,4]
  end

  it 's #give_card_to(player) can give away a card to a target player' do
    player = double :player, :hand => []
    expect{ subject.give_card_to(player) }.to change{ subject.deck_deck.count }.from(52).to(51)
  end
end
