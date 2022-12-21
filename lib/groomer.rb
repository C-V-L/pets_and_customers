require './lib/customer'
require './lib/pet'

class Groomer
  attr_reader :name, :customers, :pets_at_groomer
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def pets_at_groomer
    pets = []
    @customers.find_all { |customer| pets += customer.pets} 
    pets
  end

  def customers_who_owe
    @customers.find_all { |customer| customer.outstanding_balence > 0 }
  end

  def pets_by_type(type)
    pets_at_groomer.find_all { |pet| pet.type == type}
  end
end