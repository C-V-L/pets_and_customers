require './lib/vet_clinic'
require './lib/customer'
require './lib/pet'

RSpec.describe VetClinic do
  before(:each) do
    @vet_clinic = VetClinic.new('Healthy Pets')
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    @kimmy = Customer.new("Kimmy", 1)
    @spot = Pet.new({name: "Spot", type: :dog, age: 2})
    @simba = Pet.new({name: "Simba", type: :cat, age: 6})
    @kimmy.adopt(@spot)
    @kimmy.adopt(@simba)
    @vet_clinic.add_customer(@joel)
    @vet_clinic.add_customer(@kimmy)
  end

  it 'exisits and has a name' do
    expect(@vet_clinic).to be_a(VetClinic)
    expect(@vet_clinic.name).to eq("Healthy Pets")
  end

  it 'can add customers' do
    expect(@vet_clinic.customers).to include(@joel, @kimmy)
  end

  it 'can list pets sorted by age' do
    expect(@vet_clinic.pets_at_vet_clinic).to eq([@lucy, @simba, @samson, @spot])
  end

  it 'can tell how many pets a customer has' do
    expect(@vet_clinic.number_of_pets(@joel)).to eq(2)
    expect(@vet_clinic.number_of_pets(@kimmy)).to eq(2)
    @frankenkitty = Pet.new({name: "Franky", type: :cat, age: 6})
    @kimmy.adopt(@frankenkitty)
    expect(@vet_clinic.number_of_pets(@kimmy)).to eq(3)

  end
end