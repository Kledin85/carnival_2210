require './lib/visitor'
require './lib/ride'

RSpec.describe Visitor do

  it 'exists with attributes' do
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1).to be_a(Visitor)
    expect(visitor1.name).to eq('Bruce')
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq(10)
  end

  it 'has preferences' do
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1.preferences).to eq([])
  end

  it 'can add preferences' do
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1.preferences).to eq([])
    visitor1.add_preference(:gentle)
    expect(visitor1.preferences).to eq([:gentle])
    visitor1.add_preference(:water)
    expect(visitor1.preferences).to eq([:gentle, :water])
  end

  it 'see if a Visitor is tall enough' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')

    expect(visitor1.tall_enough?(54)).to eq true
    expect(visitor2.tall_enough?(54)).to eq false
    expect(visitor3.tall_enough?(54)).to eq true
    expect(visitor1.tall_enough?(64)).to eq false
  end

  it 'can pay an admission and reduce spending money' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    visitor1 = Visitor.new('Bruce', 54, '$10')

    visitor1.pay
    expect(visitor1.spending_money).to eq (9)
  end
end
