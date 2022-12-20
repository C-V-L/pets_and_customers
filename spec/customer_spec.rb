require './lib/customer'
require './lib/pet'

RSpec.describe Customer do
  before(:each) do
    @joel = Customer.new("Joel", 2)
  end

  it 'exisits and has attributes' do
    expect(@joel).to be_a(Customer)
  end

end
