require './lib/day_care'
require './lib/customer'
require './lib/pet'

RSpec.describe DayCare do
  before(:each) do
    @day_care = DayCare.new("The Dog Spot")
  end

end
