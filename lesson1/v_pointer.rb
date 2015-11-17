# a did not result in reassigning a to a new string
# It mutated the caller and modified the existing string, which is also pointed to by the variable b
# They're both pointing to the same thing
# output is 'hi_there'

a = 'hi there'
b = a
a.gsub!(' ', '_')
puts b

# a is reassigned the variable a to a completely different address in memory
# output is 'hi, there'
a = 'hi there' 
b = a 
a = [1, 2, 3] 
puts b