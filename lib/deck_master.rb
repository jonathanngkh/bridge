require 'card'

class Deck_Master
  attr_accessor :deck_deck

  def initialize
    @deck_deck = [
      Card.new(:spades, 2),
      Card.new(:diamonds, 2),
      Card.new(:hearts, 2),
      Card.new(:clubs, 2),
      Card.new(:spades, 3),
      Card.new(:diamonds, 3),
      Card.new(:hearts, 3),
      Card.new(:clubs, 3),
      Card.new(:spades, 4),
      Card.new(:diamonds, 4),
      Card.new(:hearts, 4),
      Card.new(:clubs, 4),
      Card.new(:spades, 5),
      Card.new(:diamonds, 5),
      Card.new(:hearts, 5),
      Card.new(:clubs, 5),
      Card.new(:spades, 6),
      Card.new(:diamonds, 6),
      Card.new(:hearts, 6),
      Card.new(:clubs, 6),
      Card.new(:spades, 7),
      Card.new(:diamonds, 7),
      Card.new(:hearts, 7),
      Card.new(:clubs, 7),
      Card.new(:spades, 8),
      Card.new(:diamonds, 8),
      Card.new(:hearts, 8),
      Card.new(:clubs, 8),
      Card.new(:spades, 9),
      Card.new(:diamonds, 9),
      Card.new(:hearts, 9),
      Card.new(:clubs, 9),
      Card.new(:spades, 10),
      Card.new(:diamonds, 10),
      Card.new(:hearts, 10),
      Card.new(:clubs, 10),
      Card.new(:spades, 11),
      Card.new(:diamonds, 11),
      Card.new(:hearts, 11),
      Card.new(:clubs, 11),
      Card.new(:spades, 12),
      Card.new(:diamonds, 12),
      Card.new(:hearts, 12),
      Card.new(:clubs, 12),
      Card.new(:spades, 13),
      Card.new(:diamonds, 13),
      Card.new(:hearts, 13),
      Card.new(:clubs, 13),
      Card.new(:spades, 14),
      Card.new(:diamonds, 14),
      Card.new(:hearts, 14),
      Card.new(:clubs, 14)
    ]
  end

  def give_card_to(player)
    player.cards << self.deck_deck.pop
  end

  def shuffle_deck_deck
    self.deck_deck = self.deck_deck.shuffle
  end


end