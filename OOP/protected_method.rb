class Animal
  def public_method
    "Will it work?" + self.protected_method
  end

  protected

  def protected_method
    "Yes! I'm protected!"
  end
end

fido = Animal.new
fido.public_method # we can call a protected method from within the class, even with self prepended
fido.protected_method