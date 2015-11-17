# 1. string interpolation vs concat
# 2. extract repetitive logic to method
# 3. keep track of variable types (class)
# 4. variable scope determined by do...end; outer scope var available to inner scope, but not vice verse
# 5. pass by ref vs pass by value; if method mutates caller, outer obj was modified

def say(msg)
  puts "=> #{msg}"
end

say "What's your first number?"
num1 = gets.chomp

say "What's your second number?"
num2 = gets.chomp

say "1) add 2) subtract 3) multiply 4)divide"
operator = gets.chomp

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
  result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
else
  result = num1.to_f / num2.to_f
end

say "Result is #{result}"