class Carnival

  attr_reader :duration,
              :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides.push(ride)
  end

  def total_revenue
    @rides.map do |ride|
      # require 'pry' ; binding.pry
      ride.total_revenue
    end.sum
  end
end
