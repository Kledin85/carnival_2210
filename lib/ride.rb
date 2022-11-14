class Ride

  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log

  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def take_admission_fee(rider)
    rider.spending_money - @admission_fee
  end

  def qualified?(rider)
    rider.tall_enough?(min_height) && rider.spending_money >= @admission_fee && rider.preferences.any? do |pref|
        pref == @excitement
        # require 'pry'; binding.pry
      end
  end

  def board_rider(rider)
    return unless qualified?(rider)
    take_admission_fee(rider)
    @total_revenue += @admission_fee
    rider_log[rider] += 1
  end
end
