class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w    
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def what_is_self
    self
  end
end

sparky = GoodDog.new("Sparky", "10cm", "10kg")
p sparky.what_is_self