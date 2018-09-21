require "rest_full/version"

class Restfull::CLI
 
  def call
    greeting
  end
 
  def greeting
    puts "Welcom to RestFull LA!"
    puts "Are you in LA? (y/n)"
   
    input = gets.strip.downcase
    if input == "n"
      puts "No worries. Take care!"
    else
      puts "Are you Hungry? (y/n)"
      
      input = gets.strip.downcase
      if input == "n"
        puts "It's all good! Maybe next time!"
      elsif input == "y"
        puts "Need Help finding a restaurant in LA? (y/n)"
        
        input = gets.strip.downcase
        if input == "n"
          puts "Ok! Hope you enjoy a great meal in LA!"
        elsif input == "y"
          puts "Great! Here's your first top-pick LA restaurant!"
          list_restaurant
          puts "Would you like another suggestion? (y/n)"
          
          input = gets.strip.downcase
          if input == "n"
            puts "bon appetit!"
          elsif input == "y"
            list_restaurant2
          end
        end
      end
    end
  end
  
  def list_restaurant
    puts "71Above"
    puts "633 W. Fifth St."
    puts "Los Angeles, California 90071"
    puts "Fine Dining"
    puts "For more info: https://www.laweekly.com/location/71above-7561812"
  end
  
  def list_restaurant2
    puts "A-Frame"
    puts "12565 Washington Blvd."
    puts "Culver City, CA 90066"
    puts "Gastro Pub, Hawaiian, International"
    puts "For more info: https://www.laweekly.com/location/a-frame-2195616"
  end
 
 
end

