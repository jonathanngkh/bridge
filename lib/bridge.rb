require 'deck_master'

class Bridge
  attr_accessor :cards, :players

  def initialize
    @cards = Deck_Master.new
    @players = [Player.new, Player.new, Player.new, Player.new]
  end

  def deal
    13.times do
      self.players.each do |player|
        self.cards.give_card_to(player)
      end
    end
  end

  def wash?
    false
  end
end