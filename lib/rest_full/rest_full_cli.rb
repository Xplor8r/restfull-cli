
class Restfull::CLI
 
  def call
    greeting
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
      puts "No worries. Take care!"
    elsif input == "y"
      puts ""
      hungry?
    else
      puts "Please enter y for yes or n for no."
      puts ""
      in_la?
    end
  end
  
  def hungry?
    puts "Are you Hungry? (y/n)"
      
    input = gets.strip.downcase
    if input == "n"
      puts "It's all good! Maybe next time!"
    elsif input == "y"
      puts ""
      help?
    else
      puts "Please enter y for yes or n for no."
      puts ""
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
        puts ""
        list_restaurant
        puts ""
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
      puts "Bon appetit!".green
    elsif input == "y"
      puts ""
      list_restaurant
      puts ""
      more_help?
    else
      puts "Please enter y for yes or n for no."
      more_help?
    end
  end
  
  def list_restaurant
   
    @restaurant = Restfull::Restaurant.top_pick
    
    puts "#{@restaurant.name}"
    puts "#{@restaurant.location}"
    puts "#{@restaurant.cuisines}"
    puts "#{@restaurant.more_info}"
  end
end

