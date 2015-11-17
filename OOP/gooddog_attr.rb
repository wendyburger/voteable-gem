# attr accessor (automatically create these getter and setter methods for us)

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says Auf Auf!" 
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} height is #{self.height}, weight is #{self.weight}"
  end

end

sparky = GoodDog.new("Sparky", "90 cm", "5 kg")
puts sparky.speak
puts sparky.name
sparky.name = "Maomao"
puts sparky.name

puts sparky.info
sparky.change_info("Tiger", "100 cm", "15 kg")
puts sparky.info

# Our output is the same! The attr_accessor method takes a symbol as an argument, 
# which it uses to create the method name for the getter and setter methods. 
# That one line replaced two method definitions.


#if we only want the getter method without the setter method? Then we would want to use the attr_reader
#if you only want the setter method, you can use the attr_writer method

#All of the attr_* methods take a Symbol as parameters

#if more state youre tracking
#attr_accessor :name, :height, :weight 