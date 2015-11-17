# 1. class and object
# 2. method contain behaviors
# 3. instance variables contain states
# 4. objects instantiated from classes, and contain states and behaviors
# 5. class variables and class methods
# 6. compare with procedural

class Dog

  attr_accessor :name, :height, :weight #have get_name && set_name method

  @@count = 0 #class variable in the class

  def self.total_dogs #call the class method
    "Total number of dogs are #{@@count}"
  end

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
    @@count += 1 #every time you initialize a data(dog), plus 1
  end

  def euthanize #didn't delete the data, just the method we created for count
    puts "#{name}: AHHHHHHHH!"
    @@count -= 1
  end

  def speak
    @name + "bark!"
  end

  # def name ----->#get_name
  #   @name
  # end

  # def name=(new_name) ----->#set_name
  #   @name = new_name
  # end

  def info
    "#{name} is #{@height} cm, weigh is #{@weight} kg"
  end

  def update_info(n, h, w)
    self.name = n #use name = n can't update info, cause ruby don't know that is local variable or setter method
    selfheight = h
    self.weight = w
  end
end

teddy = Dog.new("Teddy", 50, 10)
fido = Dog.new("Fido", 85, 20)

teddy.update_info("Maomao", 52, 17)
puts teddy.info
puts fido.info

puts teddy.name #This is get_name method
puts teddy.height #This is get_height method
puts teddy.weight #This is get_weight method

puts Dog.total_dogs #call class method
fido.euthanize
puts Dog.total_dogs

# Dog is a class
# speak is an instance method
# teddy and fido are object
# object can have different state(ig. teddy and fido initialize different name)
# we use "@" in front of instance variable, instance variable can use in every instance method
# attr_accessor has both getter and setter method
# remove "@" symbol in info method, still word, cause info method call the attr_accessor's getter method
# use self.name, self.height, self.weight to update info, "self." let Ruby know you want to call the setter method, not local variable
# we use "@@" in front of class variable










