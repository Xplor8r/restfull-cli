
class Restfull::CLI
 
  def call
    greeting
    Restfull::Scraper.scrape_page
    in_la?
  end
 
  def greeting
    puts ""
    puts "WELCOME TO RESTFULL LA!"
  end
  
  def in_la?
    puts ""
    puts "Are you in LA? (y/n)"
   
    input = gets.strip.downcase
    if input == "n"
      puts ""
      puts "No worries. Take care!"
    elsif input == "y"
      hungry?
    else
      puts ""
      puts "Please enter y for yes or n for no."
      in_la?
    end
  end
  
  def hungry?
    puts ""
    puts "Are you Hungry? (y/n)"
      
    input = gets.strip.downcase
    if input == "n"
      puts ""
      puts "It's all good! Maybe next time!"
    elsif input == "y"
      help?
    else
      puts ""
      puts "Please enter y for yes or n for no."
      hungry?
    end
  end
  
  def help?
    puts ""
    puts "Need help finding a restaurant in LA? (y/n)"
        
    input = gets.strip.downcase
      if input == "n"
      puts "Ok! Hope you enjoy a great meal in LA!"
      elsif input == "y"
        puts ""
        puts "Great! Here's your first top-pick LA restaurant!"
        puts ""
        list_restaurant
        more_help?
      else
        puts ""
        puts "Please enter y for yes or n for no."
        help?
      end  
  end
  
  def more_help?
    puts ""
    puts "Would you like another suggestion? (y/n)"
          
    input = gets.strip.downcase
    if input == "n"
      puts ""
      puts "Bon appetit!"
    elsif input == "y"
      puts ""
      list_restaurant
      more_help?
    else
      puts ""
      puts "Please enter y for yes or n for no."
      more_help?
    end
  end
  
  def list_restaurant
    restaurant = Restfull::Scraper.top_pick
    
    puts "Name: #{restaurant.name}"
    puts "Address: #{restaurant.location}"
    puts "Cuisines: #{restaurant.cuisines}"
    puts "For more info: #{restaurant.more_info}"
  end
end

