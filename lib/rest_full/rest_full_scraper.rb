
class Restfull::Scraper
  attr_accessor :name, :location, :cuisines, :more_info
  @@index = 0
  
  def self.scrape_page
    doc = Nokogiri::HTML(open("https://www.laweekly.com/restaurants/guide"))
    scraped_restaurants = []
    doc.css("div.result-set ul").each do |restaurant|
      restaurant.css("li").each do |info|
        if info.css("div.location a").text != ""
          scraped_restaurants << {
          :name => info.css("div.location a").text,
          :location => info.css("div.address").text,
          :cuisines => info.css("div.cuisines").text,
          :more_info => "https://www.laweekly.com" + info.css("div.location a").attr("href").value
        }
        end
      end
    end
    scraped_restaurants
  end

  def self.top_pick
    list_pick = self.scrape_page
    
      restaurant = list_pick[@@index]
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
