class Player
  attr_accessor :hand, :bid, :playing_card, :sets_won, :sets_to_win, :sets_to_lose, :wash_points

  def initialize
    @hand = []
    @bid = []
    @playing_card = []
    @sets_won = []
    @sets_to_win = []
    @sets_to_lose = []
    @wash_points = 0
  end

  def bid_for(level, suit)
    self.bid << level
    self.bid << suit
    self.sets_to_win = 7 + level - 1
    self.sets_to_lose = 14 - @sets_to_win
    "You will need to win #{self.sets_to_win} sets while the opponent will need #{self.sets_to_lose}."
  end

  def play(card)
    self.playing_card = card
  end
end