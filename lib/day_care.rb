require './lib/day_care'
require './lib/pet'
require './lib/customer'

class DayCare 
  attr_reader :name, :customers, :pets_at_care
  def initialize(name)
     @name = name
     @customers = []
     @pets_at_care = []
  end

  def add_customer(customer)
    @customers << customer
    @pets_at_care += customer.pets
  end

  def customer_by_id(customer_id)
    @customers.find { |customer| customer.id == customer_id }
  end

  def unfed_pets
    @pets_at_care.select { |pet| pet.fed? == false }
  end
end