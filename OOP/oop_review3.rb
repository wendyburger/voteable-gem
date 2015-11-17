# 1. Have detailed requirements or specification in written form
# 2. Extract major nouns -> classes
# 3. Extract major verbs -> instance methods
# 4. Group instance methods in to classes

class Card
  attr_accessor :suit, :value
  
  def initialize(s, v)
    @suit = s
    @value = v   
  end

  def to_s
    "This is the card #{suit}, #{value}"
  end
end



class Deck
  attr_accessor :card
  
  def initialize
    @cards = []
    ['H', 'S', 'D', 'C'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
  end
  scramble!

  def scramble!
    cards.suffle!
  end

  def deal
    cards.pop
  end
end



class Player

end



class Dealer
  
end



class Blackjack
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new('Wendy')
    @dealer = Dealer.new
  end

  def run
    deal_card
    show_flow
    players.each do |player|
      player_turn
    end
    who_won?
  end
end

# We want to write code like this:
Blackjack.new.run















