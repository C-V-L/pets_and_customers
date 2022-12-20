class Customer
  attr_reader :name, :id, :pets, :outstanding_balence
  def initialize(name, id)
    @name = name
    @id = id
    @pets = []
    @outstanding_balence = 0
  end

  def adopt(pet)
    @pets << pet
  end

  def charge(amount)
    @outstanding_balence += amount
  end
end