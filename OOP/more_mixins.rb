module Mammal
  class Dog
    def speak(sound)
      "#{sound}"
    end
  end

  class Cat
    def say(name)
      "#{name}"
    end
  end

  def self.some_out_of_place_method(num)
    num*2
  end
end

maomao = Mammal::Dog.new
puts maomao.speak("Auf!")
kitty = Mammal::Cat.new
puts kitty.say("Kitty")


value = Mammal.some_out_of_place_method(4)
puts value

value = Mammal::some_out_of_place_method(4)
puts value