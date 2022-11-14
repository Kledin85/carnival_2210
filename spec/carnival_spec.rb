require './lib/ride'
require './lib/visitor'
require './lib/carnival'

RSpec.describe Carnival do

  it 'exists with attributes' do
    carnival = Carnival.new('May 1st - May 8th')

    expect(carnival.duration).to eq('May 1st - May 8th')
    expect(carnival.rides).to eq([])
  end

  it 'can add rides' do
    carnival = Carnival.new('May 1st - May 8th')
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    expect(carnival.rides).to eq([])

    carnival.add_ride(ride1)

    expect(carnival.rides).to eq([ride1])

    carnival.add_ride(ride2)

    expect(carnival.rides).to eq([ride1, ride2])

    carnival.add_ride(ride3)

    expect(carnival.rides).to eq([ride1, ride2, ride3])


  end
end
