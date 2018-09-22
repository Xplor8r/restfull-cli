
class Restfull::CLI
 
  def call
    
    
    binding.pry
    
    greeting
    in_la?
  end
 
  def greeting
    puts "Welcom to RestFull LA!"
  end
  
  def in_la?
    puts "Are you in LA? (y/n)"
   
    input = gets.strip.downcase
    if input == "n"
      puts "No worries. Take care!"
    elsif input == "y"
      hungry?
    else
      puts "Please enter y for yes or n for no."
      in_la?
    end
  end
  
  def hungry?
    puts "Are you Hungry? (y/n)"
      
    input = gets.strip.downcase
    if input == "n"
      puts "It's all good! Maybe next time!"
    elsif input == "y"
      help?
    else
      puts "Please enter y for yes or n for no."
      hungry?
    end
  end
  
  def help?
    puts "Need help finding a restaurant in LA? (y/n)"
        
    input = gets.strip.downcase
      if input == "n"
      puts "Ok! Hope you enjoy a great meal in LA!"
      elsif input == "y"
        puts "Great! Here's your first top-pick LA restaurant!"
        list_restaurant
        more_help?
      else
        puts "Please enter y for yes or n for no."
        help?
      end  
  end
  
  def more_help?
    puts "Would you like another suggestion? (y/n)"
          
    input = gets.strip.downcase
    if input == "n"
      puts "Bon appetit!"
    elsif input == "y"
      list_restaurant2
      more_help?
    else
      puts "Please enter y for yes or n for no."
      more_help?
    end
  end
  
  def list_restaurant
   
    @restaurant = Restfull::Restaurant.top_pick
    puts "#{@restaurant.name}"
    puts "#{@restaurant.location1}"
    puts "#{@restaurant.location2}"
    puts "#{@restaurant.cuisine}"
    puts "#{@restaurant.more_info}"
  end
  
  def list_restaurant2
    puts "A-Frame"
    puts "12565 Washington Blvd."
    puts "Culver City, CA 90066"
    puts "Gastro Pub, Hawaiian, International"
    puts "For more info: https://www.laweekly.com/location/a-frame-2195616"
  end
 
 
end

