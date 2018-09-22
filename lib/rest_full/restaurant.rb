
class Restfull::Restaurant
  attr_accessor :name, :location, :cuisines, :more_info
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.top_pick
    @@all = Restfull::Scraper.scrape_page
    restaurant = @@all.shift
    top_pick = self.new
    top_pick.name = restaurant[:name]
    top_pick.location = restaurant[:location]
    top_pick.cuisines = restaurant[:cuisines]
    top_pick.more_info = restaurant[:more_info]
    top_pick
  end
  
  def all
    @@all
  end  
end
