require './lib/customer'
require './lib/pet'

class Groomer
  attr_reader :name, :customers, :pets_at_groomer
  def initialize(name)
    @name = name
    @customers = []
    @pets_at_groomer = []
  end

  def add_customer(customer)
    @customers << customer
    @pets_at_groomer += customer.pets
  end
end