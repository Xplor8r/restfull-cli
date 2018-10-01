class Restfull::Restaurant
  attr_accessor :name, :location, :cuisines, :details, :more_info, :long_details
  @@all = []
  
  def initialize(restaurant)
    restaurant.each { |key, value| self.send("#{key}=", value) }
    @@all << self
  end
  
  def self.all
    @@all 
  end
  
  def self.create_restaurant(restaurants)
    restaurants.each { |restaurant| self.new(restaurant) }
  end
end
