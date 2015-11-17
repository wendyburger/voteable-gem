Car = Class.new do # car class is object of class Class
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def self.my_class_method
    "My class method"
  end

  def an_instance_method
    puts "self is :" + self.inspect
    puts "An instance method"
  end
end


bob = Car.new('Bob')
jim = Car.new('Jim')

puts Car.my_class_method


# 1) singleton class - shadows an object
  # - can declare methods on the singleton class


  def bob.special_method # this is singleton method, just for bob
    puts "this is bob's special method!"
  end

  #bob.special_method



# 2) all classes are objects, as well
  # - all classes, are objects of class Class



