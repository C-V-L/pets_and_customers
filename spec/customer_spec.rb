require './lib/customer'
require './lib/pet'

RSpec.describe Customer do
  before(:each) do
    @joel = Customer.new("Joel", 2)
  end

  it 'exisits and has attributes' do
    expect(@joel).to be_a(Customer)
    expect(@joel.name).to eq("Joel")
    expect(@joel.id).to eq(2)
  end

  it 'starts without pets and can adopt' do
    expect(@joel.pets).to eq([])
    samson = Pet.new({name: "Samson", type: :dog, age: 3})
    lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    @joel.adopt(samson)
    @joel.adopt(lucy)
    expect(@joel.pets).to eq([samson, lucy])
  end

end
