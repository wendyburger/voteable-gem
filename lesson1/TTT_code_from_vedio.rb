require 'pry'

# 1. Come up with requirements/specifications, which will determine the scope.
# 2. Application logic; sequence of steps
# 3. Translation of those steps into code
# 4. Run code to verify logic.
#
# draw a board
#
# assign player to "X"
# assign computer to "O"
#
# loop until a winner or all squares are taken
#   player picks an empty square
#   check for a winner
#   computer picks an empty square
#   check for a winner
#
# if there's a winner,
#   show the winner
# or else
#   it's a tie

def initialize_board
  b = {}
  (1..9).each {|position| b[position] = ' '}
  b
end

def draw_board(b)
  system 'clear'
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "-----------"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "-----------"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

def empty_positions(b)
  b.select {|k, v| v == ' ' }.keys
end

def player_picks_square(b)
  puts "Pick a square (1 - 9):"
  position = gets.chomp.to_i
  b[position] = 'X'
end

def computer_picks_square(b)
  position = empty_positions(b).sample
  b[position] = 'O'
end


board = initialize_board
draw_board(board)


begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  binding.pry
end until empty_positions(board).empty?

