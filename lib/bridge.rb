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
        cards.give_card_to(player)
      end
    end
  end

  def wash?
    players.each do |player|
      player.hand.each do |card|
        case card.value
        when 14
          player.wash_points += 4
        when 13
          player.wash_points += 3
        when 12
          player.wash_points += 2
        when 11
          player.wash_points += 1
        end
      end

      if player.wash_points >= 4
        return false
      else
        return true
      end
    end
  end
end