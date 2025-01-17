class Visitor

  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.sub("$", "").to_i
    @preferences = []
  end

  def pay(ride)
    @spending_money -= ride.admission_fee
  end

  def add_preference(preference)
    @preferences.push(preference)
  end

  def tall_enough?(ride_height)
    @height >= ride_height
  end
end
