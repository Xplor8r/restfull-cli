class Restfull::Restaurant
  attr_accessor :name, :location, :cuisines, :more_info
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all 
  end
  
end
