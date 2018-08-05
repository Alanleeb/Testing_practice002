require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'attributes' do 
    # it 'has a make' do 
    #   make = 'Toyota'
    #   vehicle = Vehicle.create(make: make)
    #   expect(vehicle.make).to eq(make)
    #   vvv utilizing shoulda-matchers
    it { should respond_to :make }
    end

end
