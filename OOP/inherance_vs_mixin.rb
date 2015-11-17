module Walkable
  def walk
    "I'm walking"
  end
end

module Swimmable
  def swim
    "I'm swimming"
  end
end

module Climbable
  def climb
    "Im climbing"
  end
end

class Animal
  include Walkable

  def speak
    "I'm animal, I'm speak"
  end
end

class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts "----------GoodDog method lookup-----------"
puts GoodDog.ancestors

fido = Animal.new
puts fido.speak
puts fido.walk
puts fido.swim