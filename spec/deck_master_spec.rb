require 'deck_master'

describe Deck_Master do
  it 'holds cards in deck_hash' do
    expect(subject).to respond_to(:deck_hash)
  end

  it 's deck_hash contains 52 items' do
    expect(subject.deck_hash.count).to eq 52
  end
end
