class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age 
  def initialize(n, a)
    @name = n
    @age = a *7
  end

  def to_s
    puts "This is doog's name #{name}, age is #{age}"
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky