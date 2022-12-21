require './lib/customer'
require './lib/pet'

class VetClinic
  attr_reader :name, :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def pets_at_vet_clinic
    pets = []
    @customers.find_all { |customer| pets += customer.pets} 
    pets.sort_by(&:age).reverse
  end

  def number_of_pets(customer)
    customer.pets.count
  end
end