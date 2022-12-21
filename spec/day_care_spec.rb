require './lib/day_care'
require './lib/customer'
require './lib/pet'
require 'pry'

RSpec.describe DayCare do
  before(:each) do
    @day_care = DayCare.new("The Dog Spot")
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    @joel.adopt(@samson)
    @joel.adopt(@lucy)

  end

  it 'is an instance of DayCare and has a name' do
    expect(@day_care).to be_a(DayCare)
    expect(@day_care.name).to eq('The Dog Spot')
  end

  it 'can admit customers and their pets' do
    @day_care.add_customer(@joel)
    expect(@day_care.customers).to eq([@joel])
    expect(@day_care.pets_at_care).to eq([@samson, @lucy])
  end

  it 'can find customers by id' do
    @day_care.add_customer(@joel)    
    expect(@day_care.customer_by_id(2)).to eq(@joel)
  end

  it 'can list unfed pets' do
    @day_care.add_customer(@joel) 
    expect(@day_care.unfed_pets).to eq([@samson, @lucy])
    @samson.feed
    expect(@day_care.unfed_pets).to eq([@lucy])
    @lucy.feed
    expect(@day_care.unfed_pets).to eq([])
  end
end
