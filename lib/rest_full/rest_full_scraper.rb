
class Restfull::Scraper
  
  def self.scrape_page
    doc = Nokogiri::HTML(open("https://www.laweekly.com/restaurants/guide"))
    scraped_restaurants = []
    doc.css("div.result-set ul").each do |restaurant|
      if !doc.css("li.inline-ad")
        scraped_restaurants << {
        :name => restaurant.css("div.location a").text,
        :location => restaurant.css("div.address").text,
        :cuisines => restaurant.css("div.cuisines").text,
        :more_info => "https://www.laweekly.com" + restaurant.css("div.location a").attr("href")
      }
      end
    end
  end
  
end