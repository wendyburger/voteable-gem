class Animal
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def eat
    "#{name} is eatting"
  end

  def speak
    "#{name} is speaking!å"
  end
end


class Mammal < Animal
  def warm_blooded?
    true
  end
end

module Swimmable
  def swim
    "I'm swimming!"
  end
end


# In order to use this module, your class must response to a "name" method call
module Fetchable
  def fetch
    "#{name} is fetching"
  end
end


class Dog < Mammal
  include Swimmable
  include Fetchable


  def speak
    "#{name} is barking!"
  end
end


class Cat < Mammal
  def speak
    "#{name} is meowing!"
  end
end

maomao = Dog.new("Maomao")
# puts maomao.name
# puts maomao.eat
puts maomao.fetch
# puts maomao.speak
# puts maomao.warm_blooded?
puts maomao.swim

# kitty = Cat.new("Kitty")
# puts kitty.name
# puts kitty.eat
# puts kitty.speak




