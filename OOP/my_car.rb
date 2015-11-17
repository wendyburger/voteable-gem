class MyCar
 attr_accessor :color
 attr_reader :year, :model


  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this car"
  end

  def spray_paint(color)
    self.color
    puts "Your new color is #{color}. Thats cool!"
  end

  def to_s
    "My car is a #{self.color}, #{year}, #{model}"
  end
end

suzzuki = MyCar.new("2014", "red", "swift")
suzzuki.speed_up(50)
suzzuki.current_speed
suzzuki.brake(20)
suzzuki.current_speed
suzzuki.shut_down
suzzuki.current_speed

suzzuki.color = "blue"
puts suzzuki.year
puts suzzuki.color

suzzuki.spray_paint("black")

my_car = MyCar.new("2010", "black", "Ford")
puts my_car

