#exercise 1
class MyPet
end

maomao = MyPet.new


#---------------------------------

#exercise 2

module Say
 def say(word)
  puts "#{word}"
 end
end

class MyPet
  include Say
end

maomao = MyPet.new
maomao.say("Au Au")

