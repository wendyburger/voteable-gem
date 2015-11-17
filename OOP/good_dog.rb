# class
class GoodDog        #-----GoodDog is Object
end

sparky = GoodDog.new

#module
module Speak # Speak is module
  def speak(sound) # speak is module's method
    puts "#{sound}"
  end
end

class GoodDog #GoodDog is object
  include Speak # use "include" module to class 
end

class HumanBeing # HumanBeing is object
  include Speak # use "include" module to class
end

sparky = GoodDog.new #GoodDog Object is calling sparky
sparky.speak("Arf")

bob = HumanBeing.new #HumanBeing Object is calling bob
bob.speak("Hello")

#initailize new object
class GoodDog
  def initialize #initailize is instance method(constructor)
    puts "This object is initailized!"
  end
end

sparky = Gooddog.new #new is class method

#instance variable
class GoodDog
  def initialize(name)
    @name = name #@name is instance variable(it is one of the ways we tie data to objects)
  end

  def get_name #we want to put object's name
    @name
  end

  def set_name=(name) #we want to change object name,"set_name=" is the method name
    @name = name
  end

  def speak
    puts "#{@name} say Auf Auf!"
  end
end


sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name #can't use sparky.name 
sparky.set_name = "Maomao" #just realize there's a method called set_name= working behind the scenes
puts sparky.get_name


fido = GoodDog.new("Fido")
puts fido.speak
puts fido.get_name
fido.set_name = "Fidodo"
puts fido.get_name


#conclution:all objects of the same class have the same behaviors, 
#though they contain different states; here, the differing state is the name.

#object's name, which is stored in the @name instance variable, 
#we have to create a method that will return the name.
















