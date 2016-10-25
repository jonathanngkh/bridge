class Card
  attr_accessor :name, :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
    @name = "#{self.textual_value.to_s.capitalize}" + " of " + "#{@suit.capitalize}"
  end

  def textual_value
    case self.value
    when 2..10
      self.value
    when 11
      :jack
    when 12
      :queen
    when 13
      :king
    when 14
      :ace
    end
  end
end