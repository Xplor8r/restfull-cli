class Restfull::Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("https://www.laweekly.com/restaurants/guide"))
  end
  
end