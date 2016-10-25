require 'card'

class Deck_Creator
  attr_accessor :deck_hash

  def initialize
    @deck_hash = {
      '2 of Clubs' => Card.new(:clubs, 2),
      '3 of Clubs' => Card.new(:clubs, 3),
      '4 of Clubs' => Card.new(:clubs, 4),
      '5 of Clubs' => Card.new(:clubs, 5),
      '6 of Clubs' => Card.new(:clubs, 6),
      '7 of Clubs' => Card.new(:clubs, 7),
      '8 of Clubs' => Card.new(:clubs, 8),
      '9 of Clubs' => Card.new(:clubs, 9),
      '10 of Clubs' => Card.new(:clubs, 10),
      'Jack of Clubs' => Card.new(:clubs, 11),
      'Queen of Clubs' => Card.new(:clubs, 12),
      'King of Clubs' => Card.new(:clubs, 13),
      'Ace of Clubs' => Card.new(:clubs, 14),
      '2 of Diamonds' => Card.new(:diamonds, 2),
      '3 of Diamonds' => Card.new(:diamonds, 3),
      '4 of Diamonds' => Card.new(:diamonds, 4),
      '5 of Diamonds' => Card.new(:diamonds, 5),
      '6 of Diamonds' => Card.new(:diamonds, 6),
      '7 of Diamonds' => Card.new(:diamonds, 7),
      '8 of Diamonds' => Card.new(:diamonds, 8),
      '9 of Diamonds' => Card.new(:diamonds, 9),
      '10 of Diamonds' => Card.new(:diamonds, 10),
      'Jack of Diamonds' => Card.new(:diamonds, 11),
      'Queen of Diamonds' => Card.new(:diamonds, 12),
      'King of Diamonds' => Card.new(:diamonds, 13),
      'Ace of Diamonds' => Card.new(:diamonds, 14),
      '2 of Hearts' => Card.new(:hearts, 2),
      '3 of Hearts' => Card.new(:hearts, 3),
      '4 of Hearts' => Card.new(:hearts, 4),
      '5 of Hearts' => Card.new(:hearts, 5),
      '6 of Hearts' => Card.new(:hearts, 6),
      '7 of Hearts' => Card.new(:hearts, 7),
      '8 of Hearts' => Card.new(:hearts, 8),
      '9 of Hearts' => Card.new(:hearts, 9),
      '10 of Hearts' => Card.new(:hearts, 10),
      'Jack of Hearts' => Card.new(:hearts, 11),
      'Queen of Hearts' => Card.new(:hearts, 12),
      'King of Hearts' => Card.new(:hearts, 13),
      'Ace of Hearts' => Card.new(:hearts, 14),
      '2 of Spades' => Card.new(:spades, 2),
      '3 of Spades' => Card.new(:spades, 3),
      '4 of Spades' => Card.new(:spades, 4),
      '5 of Spades' => Card.new(:spades, 5),
      '6 of Spades' => Card.new(:spades, 6),
      '7 of Spades' => Card.new(:spades, 7),
      '8 of Spades' => Card.new(:spades, 8),
      '9 of Spades' => Card.new(:spades, 9),
      '10 of Spades' => Card.new(:spades, 10),
      '11 of Spades' => Card.new(:spades, 11),
      '12 of Spades' => Card.new(:spades, 12),
      '13 of Spades' => Card.new(:spades, 13),
      '14 of Spades' => Card.new(:spades, 14),
    }
  end
end