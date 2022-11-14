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

  it 'can calcualate total revenue from all rides' do
    carnival = Carnival.new('May 1st - May 8th')
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    carnival.add_ride(ride1)
    carnival.add_ride(ride2)
    carnival.add_ride(ride3)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)


    ride2.board_rider(visitor1)

    ride3.board_rider(visitor3)
    ride3.board_rider(visitor2)
    expect(carnival.total_revenue).to eq(10)
  end
end
