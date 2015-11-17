# Is a relationship => heritance

class Animal
  def speak
    puts "I'm speaking"
  end

  def smell
    
  end
end



# Has a relationship => composition

module Swimmable
  def swim
    puts "I'm swimming"
  end
end

class Dog < Animal
  include Swimmable
end


class Cat <Animal
  def speak
    puts "meow"
  end
end



dog1 = Dog.new
dog1.speak
cat1 = Cat.new
cat1.speak

dog1.swim
cat1.swim


