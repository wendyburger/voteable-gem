class MyCar
  def self.gas_miles(liters, miles)
    puts "#{miles/liters}miles per litter gas"
  end

  def to_s
    "My Car is #{self.color}, #{self.year}, #{@model}"
  end
end

MyCar.gas_miles(1.5, 25)
my_car = MyCar.new("2014", "red", "suzzuki")
puts my_car