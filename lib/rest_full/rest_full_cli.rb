class Restfull::CLI
  @@count = 0
  
  def call
    greeting
    restaurants
    in_la?
  end
  
  def restaurants
    restaurants = Restfull::Scraper.scrape_page
    Restfull::Restaurant.create_restaurant(restaurants)
  end

  def greeting
    puts ""
    puts "WELCOME TO RESTFULL LA!".color(:white).background(:cyan)
  end
  
  def in_la?
    puts ""
    puts "Are you in LA? (".color(:cyan) + "y".color(:green) + "/".color(:cyan)  + "n".color(:red) + ")".color(:cyan) 
    input = gets.strip.downcase
    
    if input == "n"
      puts ""
      come_back
    elsif input == "y"
      hungry?
    else
      yes_no
      in_la?
    end
  end
  
  def yes_no
    puts ""
    puts "Please enter ".color(:cyan)  + "y".color(:green) + " for yes or ".color(:cyan)  + "n".color(:red) + "for no.".color(:cyan) 
  end
  
  def hungry?
    puts ""
    puts "Are you Hungry? (".color(:cyan)  + "y".color(:green) + "/".color(:cyan)  + "n".color(:red) + ")".color(:cyan) 
    input = gets.strip.downcase
    
    if input == "n"
      puts ""
      goodbye
    elsif input == "y"
      puts ""
      puts "Would you like me to select an 'A-list' restaurant for you? (".color(:cyan)  + "y".color(:green) + "/".color(:blue)  + "n".color(:red) + ")".color(:cyan) 
      random_pick?
    else
      yes_no
      hungry?
    end
  end
  
  def random_pick?
    input = gets.strip.downcase
    
    if input == "n"
      puts ""
      a_list?
    elsif input == "y"
      list_pick
      puts "Would you like me to select another 'A-list' restaurant for you? (".color(:cyan)  + "y".color(:green) + "/".color(:cyan)  + "n".color(:red) + ")".color(:cyan) 
      random_pick?
    else
      yes_no
      random_pick?
    end
  end 
  
  def a_list?
    puts "Would you like a list of 'A-list' restaurants in LA? (".color(:cyan)  + "y".color(:green) + "/".color(:cyan)  + "n".color(:red) + ")".color(:cyan) 
    input = gets.strip.downcase
    
    if input == "n"
      bon_appetit
    elsif input == "y"
      puts ""
      puts "Great! Here's a list of 'A-list' LA restaurants!".color(:cyan) 
      puts ""
      list_restaurants
      more_info?
    else
      yes_no
      a_list?
    end  
  end
  
  def list_restaurants
    restaurant = Restfull::Restaurant.all
    restaurant.each_with_index {|restaurant, index| puts "#{index + 1}: #{restaurant.name}"}
  end
  
  def more_info?
    puts ""
    puts "Please select a restaurant for more info.".color(:cyan) 
    puts "Enter a number between ".color(:cyan) + "1 ".color(:yellow) + "and".color(:cyan) + " #{Restfull::Restaurant.all.length}".color(:yellow) + " or type ".color(:cyan) + "e ".color(:yellow) + "to exit.".color(:cyan) 
    input = gets.strip.downcase
    
    if input == "e"
      bon_appetit
    elsif input.to_i > 0 && input.to_i <= Restfull::Restaurant.all.length 
      restaurant = Restfull::Restaurant.all[input.to_i-1]
      
      puts ""
      puts "Name: #{restaurant.name}"
      puts "Address: #{restaurant.location}"
      puts "Cuisines: #{restaurant.cuisines}"
      puts "Details: #{restaurant.details}"
      puts ""
      puts "Would you like to read more details? (".color(:cyan) + "y".color(:green) + "/".color(:cyan) + "n".color(:red) + ")".color(:cyan) 
      input2 = gets.strip.downcase
    
      if input2 == "y"
        details = Restfull::Scraper.scrape_more_info("#{restaurant.more_info}").split.join(" ").chomp("Read our full review.")
        puts ""
        puts details
        puts ""
        more_info?
      elsif input2 == "n"
        random_pick?
      else
        yes_no
        more_info?
      end
    else
      puts "Not a valid selection."
      more_info?
    end
  end

  def list_pick
    pick = Restfull::Restaurant.all
    index = @@count
    
    if pick[index] != nil
      puts ""
      puts "Name: #{pick[index].name}"
      puts "Address: #{pick[index].location}"
      puts "Cuisines: #{pick[index].cuisines}"
      puts "Details: #{pick[index].details}"
      puts ""
      puts "Would you like to read more details? (".color(:cyan)  + "y".color(:green) + "/".color(:cyan)  + "n".color(:red) + ")".color(:cyan) 
      input = gets.strip.downcase
    
      if input == "y"
        details = Restfull::Scraper.scrape_more_info("#{pick[index].more_info}").split.join(" ").chomp("Read our full review.")
        puts ""
        puts details
        puts ""
        puts "Would you like me to select another 'A-list' restaurant for you? (".color(:cyan)  + "y".color(:green) + "/".color(:cyan)  + "n".color(:red) + ")".color(:cyan) 
      elsif input == "n"
        puts ""
        puts "Would you like me to select another 'A-list' restaurant for you? (".color(:cyan)  + "y".color(:green) + "/".color(:cyan)  + "n".color(:red) + ")".color(:cyan) 
      else
        yes_no
      end
      @@count += 1
      random_pick?
    else
      puts ""
      puts "Sorry, I don't have any more 'A-list' picks.".color(:cyan) 
      a_list?
    end
  end
  
  def come_back
    puts "Ok. If you are ever in LA make sure to visit RestFull LA again!".color(:yellow)
  end

  def bon_appetit
    puts "Farewell! Bon appetit!".color(:yellow)
  end
  
  def goodbye
    puts "No worries. Hope you find a great meal in LA!".color(:yellow) 
  end
end
