require './lib/pet'

RSpec.describe Pet do
  before(:each) do 
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
  end
  
  it 'exisits and has attributes' do
    expect(@samson).to be_a(Pet)
    expect(@samson.name).to eq("Samson")
    expect(@samson.type).to eq(:dog)
    expect(@samson.age).to be(3)
  end

  it 'starts out as not fed and can be fed' do
    expect(@samson.fed?).to be false
    @samson.feed
    expect(@samson.fed?).to be true
  end

end
