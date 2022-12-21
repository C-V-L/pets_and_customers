require './lib/groomer'
require './lib/customer'
require './lib/pet'
require 'pry'

RSpec.describe Groomer do
  before(:each) do 
    @groomer = Groomer.new('Fancy Pooches')
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
  end

  it 'is an instence of Groomer and has a name' do
    expect(@groomer).to be_a(Groomer)
  end

  it 'can list customers and their pets' do
    @groomer.add_customer(@joel)
    expect(@groomer.customers).to eq([@joel])
    expect(@groomer.pets_at_groomer).to eq([@samson, @lucy])
  end

  it 'can list customers w/ outstanding balence' do
    @groomer.add_customer(@joel)
    expect(@groomer.customers_who_owe).to eq([])
    @joel.charge(50)
    expect(@groomer.customers_who_owe).to eq([@joel])
  end

  it 'can list number of each pet type' do
    @groomer.add_customer(@joel)
    expect(@groomer.pets_by_type(:dog).count).to eq(1)
    expect(@groomer.pets_by_type(:cat).count).to eq(1)
    kimmy = Customer.new("Kimmy", 1)
    @groomer.add_customer(kimmy)
    spot = Pet.new({name: "Spot", type: :dog, age: 12})
    simba = Pet.new({name: "Simba", type: :cat, age: 15})
    kimmy.adopt(spot)
    kimmy.adopt(simba)
    expect(@groomer.pets_by_type(:dog).count).to eq(2)
    expect(@groomer.pets_by_type(:cat).count).to eq(2)
  end
end
