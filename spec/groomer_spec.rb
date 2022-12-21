require './lib/groomer'
require './lib/customer'
require './lib/pet'

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
end
