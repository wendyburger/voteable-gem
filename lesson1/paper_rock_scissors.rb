# 1. all player pick ether paper, rock or scissors
# 2. compare: paper > rock, rock > scissors, scissors > paper; tie = same
# 3. play again?

CHOICE = {'p' => 'paper', 'r' => 'rock', 's' => 'scissors'}
puts "Welcome the game of Paper, Rock, Scissors"

def winning_message(winning_choice)
  case winning_choice
  when 'p'
    puts "Paper wraps Rock"
  when 'r'
    puts "Rock smashes Scissors"
  else
    puts "Scissors cuts Paper"
  end
end


loop do
  #player choice Paper/Rock/Scissor
  begin

  puts "What's your choice? (p/r/s)"
  player_choice = gets.chomp.downcase
    
  end until CHOICE.keys.include?(player_choice)

  #computer choice Paper/Rock/Scissor
  computer_choice = CHOICE.keys.sample

  #compare
  if player_choice == computer_choice
    puts "It's tie"
  elsif player_choice == 'p' && computer_choice == 'r' || player_choice == 'r' && computer_choice == 's' || player_choice == 's' && computer_choice == 'p'
    puts "You won!"
    winning_message(player_choice)
  else
    puts "Computer won!"
    winning_message(computer_choice)
  end

  puts "Do you want to play again? (y/n)"
  choice = gets.chomp.downcase
  break if choice != 'y'

end
