require 'deck_master'

class Bridge
  attr_accessor :cards, :players

  def initialize
    @cards = Deck_Master.new.deck_deck
    @players = []
  end
end