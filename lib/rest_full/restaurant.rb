
class Restfull::Restaurant
  attr_accessor :name, :location, :cuisines, :more_info
  @@all = []
  @@index = 0
  
  def self.top_pick
    @@all = Restfull::Scraper.scrape_page
    
      restaurant = @@all[@@index]
      top_pick = self.new
      if restaurant == nil
        puts "Sorry, I don't have any more suggestions."
        abort
      else
        top_pick.name = restaurant[:name]
        top_pick.location = restaurant[:location]
        top_pick.cuisines = restaurant[:cuisines]
        top_pick.more_info = restaurant[:more_info]
        @@index += 1
        top_pick
      end
  end
end
