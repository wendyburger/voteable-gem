# method not mutate the caller
# The output is 1 2 2 3; the scope array is affected by the method invocation

def my_method(arr)
  arr.uniq
end

my_arr = [1, 2, 2, 3]
my_method(my_arr)
puts my_arr





# method mutate the caller
# The output is 1 2 3

def my_method(arr)
  arr.uniq!
end

my_arr = [1, 2, 2, 3]
my_method(my_arr)
puts my_arr