require 'deck_master'

class Bridge
  attr_accessor :cards, :players

  def initialize
    @cards = Deck_Master.new
    @players = [Player.new, Player.new, Player.new, Player.new]
  end

  def deal
    13.times do
      players.each do |player|
        self.cards.give_card_to(player)
      end
    end

    wash if wash?
  end

  def wash
    self.players.each { |player| player.reset }
    self.cards = Deck_Master.new
  end

  def wash?
    self.players.each do |player|
      player.hand.each do |card|
        if card.value > 10
          player.wash_points += card.value - 10
        end

        case card.suit
        when :clubs
          player.suit_counter[:clubs] += 1
        when :diamonds
          player.suit_counter[:diamonds] += 1
        when :hearts
          player.suit_counter[:hearts] += 1
        when :spades
          player.suit_counter[:spades] += 1
        end
      end

    player.suit_counter.each do |suit, counter|
      player.wash_points += counter - 4 if counter > 4
    end

      if player.wash_points >= 4
        return false
      else
        return true
      end
    end
  end
end