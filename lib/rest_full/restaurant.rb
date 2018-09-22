
class Restfull::Restaurant
  attr_accessor :name, :location, :cuisines, :more_info
  

  
  def self.top_pick
    restaurants = Restfull::Scraper.scrape_page
    top_pick = self.new
    top_pick.name = restaurants.first[:name]
    top_pick.location = restaurants.first[:location]
    top_pick.cuisines = restaurants.first[:cuisines]
    top_pick.more_info = restaurants.first[:more_info]
    top_pick
  end
end