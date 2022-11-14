require './lib/ride'
require './lib/visitor'


RSpec.describe Ride do

  it 'exists with attributes' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    expect(ride1).to be_a(Ride)
    expect(ride1.name).to eq('Carousel')
    expect(ride1.min_height).to eq(24)
    expect(ride1.admission_fee).to eq(1)
    expect(ride1.excitement).to eq(:gentle)
  end

  it 'has a total revenue' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    expect(ride1.total_revenue).to eq(0)
  end

  it 'has a rider log' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    expect(ride1.rider_log).to eq ({})
  end

  it 'can board a visitor' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)

    expect(ride1.rider_log[visitor1]).to eq(1)
    expect(ride1.rider_log[visitor2]).to eq(1)
    ride1.board_rider(visitor1)
    expect(ride1.rider_log[visitor1]).to eq(2)
    expect(ride1.total_revenue).to eq(3)
  end

  it 'takes an admission fee' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(ride1.take_admission_fee(visitor1)).to eq(9)
    expect(ride1.take_admission_fee(visitor1)).to eq(8)
  end

  it 'can check if a rider is qualified to board a ride' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Day', 23, '$10')
    visitor1.add_preference(:gentle)
    visitor1.add_preference(:water)
    visitor2.add_preference(:gentle)
    visitor2.add_preference(:water)


    expect(ride1.qualified?(visitor1)).to eq true
    expect(ride1.qualified?(visitor2)).to eq false

  end
end
