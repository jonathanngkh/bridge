class Player
  attr_accessor :hand, :bid, :playing_card, :sets_won, :sets_to_win, :sets_to_lose, :wash_points, :suit_counter, :partner_card

  def initialize
    setup
  end

  def reset
    setup
  end

  def bid_for(level, suit)
    self.bid << level
    self.bid << suit
    self.sets_to_win = 7 + level - 1
    self.sets_to_lose = 14 - self.sets_to_win
    "You will need to win #{self.sets_to_win} sets while the opponent will need #{self.sets_to_lose}."
  end

  def choose_partner(value_number, suit_name)
    self.partner_card = value_number.to_s + ', :' + "#{suit_name}"
  end

  def play(card)
    self.playing_card = card
  end

  private

  def setup
    @hand = []
    @bid = []
    @playing_card = []
    @sets_won = []
    @sets_to_win = []
    @sets_to_lose = []
    @wash_points = 0
    @suit_counter = {
      :clubs => 0,
      :diamonds => 0,
      :hearts => 0,
      :spades => 0,
    }
    @partner_card = []
  end
end