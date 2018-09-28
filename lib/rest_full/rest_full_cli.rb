class Restfull::CLI
  @@count = 0
  
  def call
    scrape_restaurants
    greeting
  end
  
  def scrape_restaurants
    restaurants = Restfull::Scraper.scrape_page
    Restfull::Restaurant.create_restaurant(restaurants)
  end
  
  def new_line
    "\n"
  end
  
  def greeting
    puts new_line + "Are you in LA? (".color(:cyan) + y_n
    input = gets.strip.downcase
    
    if input == "n"
      puts new_line + "Ok. If you are ever in LA make sure to visit RestFull LA again!".color(:yellow)
    elsif input == "y"
      hungry?
    else
      yes_no
      greeting
    end
  end
  
  def y_n
    "y".color(:green) + "/".color(:cyan)  + "n".color(:red) + ")".color(:cyan) 
  end
    
  def yes_no
    puts new_line + "Please enter ".color(:cyan)  + "y".color(:green) + " for yes or ".color(:cyan)  + "n".color(:red) + " for no.".color(:cyan) 
  end
  
  def hungry?
    puts new_line + "Are you Hungry? (".color(:cyan)  + y_n
    input = gets.strip.downcase
    
    if input == "n"
      puts new_line + "No worries. Hope you find a great meal in LA!".color(:yellow) 
    elsif input == "y"
      puts new_line + "Would you like me to select an 'A-list' restaurant for you? (".color(:cyan)  + y_n
      random_pick?
    else
      yes_no
      hungry?
    end
  end
  
  def random_pick?
    input = gets.strip.downcase
    
    if input == "n"
      a_list?
    elsif input == "y"
      list_pick
    else
      yes_no
      random_pick?
    end
  end 

  def list_pick
    pick = Restfull::Restaurant.all
    index = @@count
    
    if pick[index] != nil
      puts new_line + "Name: #{pick[index].name}"
      puts "Address: #{pick[index].location}"
      puts "Cuisines: #{pick[index].cuisines}"
      puts "Details: #{pick[index].details}"
      
      more_details = Restfull::Scraper.scrape_more_info("#{pick[index].more_info}").split.join(" ").chomp("Read our full review.")
      details_from_pick(more_details)
      @@count += 1
      random_pick?
    else
      puts new_line + "Sorry, I don't have any more 'A-list' picks.".color(:cyan) 
      a_list?
    end
  end
  
  def details_from_pick(more_details)
    puts new_line + "Would you like to read more details? (".color(:cyan)  + y_n
    input = gets.strip.downcase
    
    if input == "y"
      puts new_line + more_details
      puts new_line + "Would you like me to select another 'A-list' restaurant for you? (".color(:cyan)  + y_n
    elsif input == "n"
      puts new_line + "Would you like me to select another 'A-list' restaurant for you? (".color(:cyan)  + y_n
    else
      yes_no
      details_from_pick(more_details)
    end
  end
  
  def a_list?
    puts new_line + "Would you like a list of 'A-list' restaurants in LA? (".color(:cyan)  + y_n
    input = gets.strip.downcase
    
    if input == "n"
      puts new_line + "Farewell! Bon appetit!".color(:yellow)
    elsif input == "y"
      puts new_line + "Great! Here's a list of 'A-list' LA restaurants!".color(:cyan)
      list_restaurants
      more_info?
    else
      yes_no
      a_list?
    end  
  end
  
  def list_restaurants
    restaurant = Restfull::Restaurant.all
    puts new_line
    restaurant.each_with_index {|restaurant, index| puts "#{index + 1}: #{restaurant.name}"}
  end
  
  def more_info?
    puts new_line + "Please select a restaurant for more info.".color(:cyan) 
    puts "Enter a number between ".color(:cyan) + "1 ".color(:yellow) + "and".color(:cyan) + " #{Restfull::Restaurant.all.length}".color(:yellow) + " or type ".color(:cyan) + "e ".color(:yellow) + "to exit.".color(:cyan) 
    input = gets.strip.downcase
    
    if input == "e"
      puts new_line + "Farewell! Bon appetit!".color(:yellow)
    elsif input.to_i > 0 && input.to_i <= Restfull::Restaurant.all.length 
      restaurant = Restfull::Restaurant.all[input.to_i-1]
      puts new_line + "Name: #{restaurant.name}"
      puts "Address: #{restaurant.location}"
      puts "Cuisines: #{restaurant.cuisines}"
      puts "Details: #{restaurant.details}"
      
      more_details = Restfull::Scraper.scrape_more_info("#{restaurant.more_info}").split.join(" ").chomp("Read our full review.")
      details_from_list_pick(more_details)
    else
      puts "Not a valid selection.".color(:cyan)
      more_info?
    end
  end

  def details_from_list_pick(more_details)
    puts new_line + "Would you like to read more details? (".color(:cyan) + y_n
    input = gets.strip.downcase
    
    if input == "y"
      puts new_line + more_details
      more_info?
    elsif input == "n"
      more_info?
    else
      yes_no
      details_from_list_pick(more_details)
    end
  end
end
