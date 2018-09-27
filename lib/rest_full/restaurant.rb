class Restfull::Restaurant
  attr_accessor :name, :location, :cuisines, :more_info
  @@all = []
  
  def initialize(restaurants)
    restaurants.each { |key, value| self.send("#{key}=", value) }
    @@all << self
  end
  
  def self.all
    @@all 
  end
  
end
