
class Restfull::Scraper
  
  def self.scrape_page
    doc = Nokogiri::HTML(open("https://www.laweekly.com/restaurants/guide"))

    doc.css("div.result-set ul").each do |restaurant|
      restaurant.css("li").each do |info|
        if info.css("div.location a").text != ""
          new_restaurant = Restfull::Restaurant.new
          new_restaurant.name = info.css("div.location a").text
          new_restaurant.location = info.css("div.address").text
          new_restaurant.cuisines = info.css("div.cuisines").text
          new_restaurant.more_info = "https://www.laweekly.com" + info.css("div.location a").attr("href").value
        end
      end
    end
  end
  
  def self.scrape_info_page
    info_doc = Nokogiri::HTML(open(new_restaurant.more_info))
    new_restaurant.name = info_doc.css("h1").text
    new_restaurant.description = info_doc.css(".description").text
  end
end
