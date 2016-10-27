class Player
  attr_accessor :hand, :bid, :playing_card

  def initialize
    @hand = []
    @bid = []
    @playing_card = []
  end

  def bid_for(bid)
    self.bid = bid
  end

  def play(card)
    self.playing_card = card
  end
end