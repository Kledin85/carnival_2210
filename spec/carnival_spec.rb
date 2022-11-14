require './lib/ride'
require './lib/visitor'
require './lib/carnival'

RSpec.describe Carnival do

  it 'exists with attributes' do
    carnival = Carnival.new('May 1st - May 8th')

    expect(carnival.duration).to eq('May 1st - May 8th')
    expect(carnival.rides).to eq([])
  end
end
