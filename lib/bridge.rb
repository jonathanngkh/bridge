require 'deck_master'

class Bridge
  attr_accessor :cards, :players, :current_bid, :rank

  def initialize
    @cards = Deck_Master.new
    @players = [Player.new, Player.new, Player.new, Player.new]
    @current_bid = [0, :clubs]
    @rank = {
      :pass =>     0,
      :clubs =>    1,
      :diamonds => 2,
      :hearts =>   3,
      :spades =>   4,
      :notrump =>  5
    }
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

  def change_current_bid_to players_bid
    same_level = players_bid[0] == self.current_bid[0]
    players_suit_is_higher = self.rank[players_bid[1]] > rank[self.current_bid[1]]
    players_level_is_higher = players_bid[0] > self.current_bid[0]

    if same_level && players_suit_is_higher
      self.current_bid = players_bid
    elsif players_level_is_higher
      self.current_bid = players_bid
    elsif players_bid == [0, :pass]
      :pass
    else
      "You can only make a higher bid"
    end
  end
end