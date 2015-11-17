require 'rubygems'
require 'pry'

# 1. 一副撲克牌
# 2. 洗牌
# 3. dealer
# 4. player
# 5. dealer發兩張牌給玩家,兩張牌給自己
# 6. 計算點數
# 6. 若dealer點數大於17則不發牌,小於17則須補牌
# 7. player可決定要補牌於否,超過21點就爆,每次補牌都須算一次點數

#solution:
# 1) Abstraction (抽象化)
# 2) Encapsulation (封套)

class Card
  attr_accessor :suit, :face_number

  def initialize(s, fn)
    @suit = s
    @face_number = fn
  end

  def pretty_output
    "The #{face_number} of #{find_suit}"
  end

  def to_s
    pretty_output
  end

  def find_suit
    ret_val = case suit
                when 'H' then 'Hearts'
                when 'D' then 'Diamonds'
                when 'C' then 'Clubs'
                when 'S' then 'Slades'
              end
    ret_val
  end
end




class Deck
  attr_accessor :cards

  def initialize
    @cards = []

    ['H', 'D', 'C', 'S'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_number|
        @cards << Card.new(suit, face_number)
      end
    end
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end

  def size
    cards.size
  end
end



module Hand
  def show_hand
    puts "-----------#{name}'s Hand-----------"

    cards.each do|card|
      puts "#{card}"
    end
      puts "Total: #{total}" 
  end

  def total
    face_number = cards.map {|card| card.face_number}

    total = 0
    face_number.each do |val|
      if val == 'A'
        total += 11
      else
        total += (val.to_i == 0 ? 10 : val.to_i)
      end
    end

    # correct for Aces
    face_number.select{|val| val == "A"}.count.times do
      break if total <= 21
      total -= 10
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def is_busted?
    total > Blackjack::BLACKJACK_AMOUNT
  end
end




class Player
  include Hand

  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end
  
  def show_flop
    show_hand
  end
end




class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end

  def show_flop
    puts "-----------Dealer's Hand-----------"
    puts "=> The first card is hidden"
    puts "=> The second card is #{cards[1]}"
  end
end




class Blackjack
  attr_accessor :deck, :player, :dealer

  BLACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 17

  def initialize
    @deck = Deck.new
    @player = Player.new("Player1")
    @dealer = Dealer.new
  end

  def set_player_name
    puts "--------What's your name?--------"
    player.name = gets.chomp #setter method
  end

  def deal_cards
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_AMOUNT
      if player_or_dealer.is_a?(Dealer)
        puts "Sorry, dealer hit blackjack. #{player.name} loses."
      else
        puts "Congratulations, you hit blackjack. #{player.name} wins!"
      end
      play_again?
    elsif player_or_dealer.is_busted?
      if player_or_dealer.is_a?(Dealer)
        puts "Congratulations, dealer busted. #{player.name} wins!"
      else
        puts "Sorry, you busted. #{player.name} loses."
      end
      play_again?
    end
  end

  def player_turn
    puts "-------- It's #{player.name}'s' turn. --------"
    blackjack_or_bust?(player)

    while !player.is_busted?
      puts "What do you want to do? 1) hit 2) stay"
      response = gets.chomp.to_s
      if !['1', '2'].include?(response)
        puts "Error: You must enter 1 or 2"
        next
      end
      
      if response == '2'
        puts "#{player.name} choose stay."
        break 
      end
      
      #hit
      new_card = deck.deal_one
      puts "Dealing card to #{player.name}: #{new_card}"
      player.add_card(new_card)
      puts "#{player.name}'s total now is: #{player.total}"

      blackjack_or_bust?(player)
    end
    puts "#{player.name} stays at #{player.total}."
  end

  def dealer_turn
    puts "-------- It's Dealer's turn. --------"
    blackjack_or_bust?(dealer)  

    while dealer.total < DEALER_HIT_MIN
      new_card = deck.deal_one
      puts "Dealing card to dealer: #{new_card}"
      dealer.add_card(new_card)
      puts "Dealer's total now is: #{dealer.total}"
      

      blackjack_or_bust?(dealer)
    end
    puts "Dealer stays at #{dealer.total}."
  end

  def who_won?
    if player.total > dealer.total
      puts "Congratulations, #{player.name} wins!"
    elsif player.total < dealer.total
      puts "Sorry, #{player.name} loses."
    else
      puts "Its a tie!"
    end
    play_again?
  end

  def play_again?
    puts ""
    puts "Would you like to play again? 1) Yes 2)No, exit"
    
    if gets.chomp == '1'
      puts ""
      puts "Starting new game..."
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      start
    else
      puts "Goodbye!"
      exit 
    end
  end

  def start
    set_player_name
    deal_cards
    show_flop
    player_turn
    dealer_turn
    who_won?
  end
end




game = Blackjack.new
game.start
