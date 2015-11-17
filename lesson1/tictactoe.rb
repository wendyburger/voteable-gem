require 'pry'
# 1. Come up with requirement/specification, which will determine the scope
# 2. Application of logic:sequence of steps
# 3. Translation of those steps into code
# 4. Run code to varify logic

# draw the board

# assign player to "x"
# assign computer to "o"

# loop until a winner or all aquares are taken
#   player pick an empty square
#   check for a winner
#   computer pick an empty square
#   check for a winner

# if there's a winner, 
#   show the winner 
# or else 
#   it's tie

def initialize_board
  b = {}
  (1..9).each {|position| b[position] = ''}
  b
end
 

def draw_board(b)
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "---------"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "---------"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

def empty_position(b)
  b.select {|k, v| v == ''}.keys
end

def player_pick_square(b)
  begin
  puts "Pick a square (1 - 9):"
  position = gets.chomp.to_i
  end until empty_position(b).include?(position)
  b[position] = 'X'
end


def computer_pick_square(b)
  position = empty_position(b).sample
  puts 'computer pick? '+position.to_s
  b[position] = 'O'
end

def check_winner(b)
  winning_line = [[1,2,3],[1,4,7],[1,5,9],[2,5,8],[3,5,7],[3,6,9],[4,5,6],[7,8,9]]
  winning_line.each do |line|
    return 'Player' if b.values_at(*line).count('X') == 3
    return 'Computer' if b.values_at(*line).count('O') == 3
  end
  nil
end

board = initialize_board
draw_board(board)


begin
  player_pick_square(board)
  computer_pick_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_position(board).empty?

if winner
  puts "#{winner} won!"
else
  puts "It's a tie"
end




