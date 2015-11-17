class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1 
  end

  def self.total_number_of_dogs
    @@number_of_dogs 
  end 
end

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs

#Remember that initialize gets called every time we instantiate a new object via the new method