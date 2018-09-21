
class Restfull::Restaurant
  attr_accessor :name, :location, :cuisine, :more_info
  
  @@all = []
  
  def initialize
    @name = name
    @location = location
    @cuisine = cuisine
    @more_info = more_info
    @@all << self
  end
  
  def self.top_pick

    
    top_pick = self.new
    top_pick.name = "71Above"
    top_pick.location = "633 W. Fifth St.Los Angeles, California 90071"
    top_pick.cuisine = "Fine Dining"
    top_pick.more_info = "For more info: https://www.laweekly.com/location/71above-7561812"
    top_pick
  end
  
  
end