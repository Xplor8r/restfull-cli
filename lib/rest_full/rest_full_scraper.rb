
class Restfull::Scraper
  
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
end