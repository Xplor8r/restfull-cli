class Restfull::Restaurant
  attr_accessor :name, :location1, :location2, :cuisine, :more_info
  
  @@all = []
  
  def initialize
    @name = name
    @location1 = location1
    @location2 = location2
    @cuisine = cuisine
    @more_info = more_info
    @@all << self
  end
  
  def self.top_pick

    
    top_pick = self.new
    top_pick.name = "71Above"
    top_pick.location1 = "633 W. Fifth St."
    top_pick.location2 = "Los Angeles, California 90071"
    top_pick.cuisine = "Fine Dining"
    top_pick.more_info = "For more info: https://www.laweekly.com/location/71above-7561812"
    top_pick
  end
  
  
end