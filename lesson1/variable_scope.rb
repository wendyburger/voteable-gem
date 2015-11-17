# 1. Create a local variable and modify it at an inner scope

# a) re-assigning the variable to something else
# The result is 'hi,there'
x = 4

loop do
  x = 'hi, there'
  break
end

puts x


# b) call a method that doesn’t mutate the caller
# The output is [1, 2, 2, 3]
def no_mutate(arr)
  arr.uniq
end

my_arr = [1, 2, 2, 3]
no_mutate(my_arr)
puts my_arr

# c) call a method that mutate the caller
# The output is [1, 2, 3]
def no_mutate(arr)
  arr.uniq!
end

my_arr = [1, 2, 2, 3]
no_mutate(my_arr)
puts my_arr


# 2. Create a local variable at an inner scope and try to reference it in the outer scope
# undefined local variable or method
def add(num1, num2)
  result = num1 + num2
end

add(2, 3)
puts result


# Perform similar code experiments as outlined in #1
def loop_test(x)
  loop do
    x = 'hi, there'
    a = x
    break
  end
end

loop_test(4)
puts a

# 3. How do variable scope rules pertain to methods?
# The output is undefined local variable or method `x'
x = "hi"

def my_method
  puts x
end

my_method















