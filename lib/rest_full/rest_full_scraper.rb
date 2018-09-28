
class Restfull::Scraper
  
  def self.scrape_page
    doc = Nokogiri::HTML(open("https://www.laweekly.com/restaurants/guide"))
    restaurants = []
    doc.css("div.result-set ul").each do |restaurant|
      restaurant.css("li").each do |info|
        if info.css("div.location a").text != ""
          restaurants << {
          :name => info.css("div.location a").text,
          :location => info.css("div.address").text,
          :cuisines => info.css("div.cuisines").text,
          :details => info.css("p").text,
          :more_info => "https://www.laweekly.com" + info.css("div.location a").attr("href").value
          }
        end
      end
    end
    restaurants
  end
  
  def self.scrape_more_info(more_info)
    doc = Nokogiri::HTML(open(more_info))
    doc.css("div.description").text
  end
end
