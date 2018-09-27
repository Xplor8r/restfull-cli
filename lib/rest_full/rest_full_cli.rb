

class Restfull::CLI
  @@count = 0
  
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
      goodbye
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
      goodbye
    elsif input == "y"
      puts ""
      puts "Would you like me to select an 'A-list' restaurant for you? (y/n)"
      random_pick?
    else
      puts ""
      puts "Please enter y for yes or n for no."
      hungry?
    end
  end
  
  def a_list?
    puts ""
    puts "Would you like a list of 'A-list' restaurants in LA? (y/n)"
        
    input = gets.strip.downcase
      if input == "n"
      bon_appetit
      elsif input == "y"
        puts ""
        puts "Great! Here's a list of 'A-list' LA restaurants!"
        puts ""
        list_restaurant
        more_info?
      else
        puts ""
        puts "Please enter y for yes or n for no."
        a_list?
      end  
  end
  
  def list_restaurant
    restaurant = Restfull::Restaurant.all
    restaurant.each_with_index {|restaurant, index| puts "#{index + 1}: #{restaurant.name}"}
  end
  
  def more_info?
    puts ""
    puts "Please select a restaurant for more_details."
    puts "Enter a number between 1 and #{Restfull::Restaurant.all.length} or type e to exit. "

    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i <= Restfull::Restaurant.all.length 
      restaurant = Restfull::Restaurant.all[input.to_i-1]
      puts ""
      puts "Name: #{restaurant.name}"
      puts "Address: #{restaurant.location}"
      puts "Cuisines: #{restaurant.cuisines}"
      puts "Link to more info: #{restaurant.more_info}"
      puts ""
      more_info?
    elsif input == "e"
      bon_appetit
    else
      puts "Not a valid selection."
      more_info?
    end
    
  end
  
  def random_pick?
    
    input = gets.strip.downcase
    if input == "n"
      puts ""
      a_list?
    elsif input == "y"
      list_pick
      puts "Would you like me to select another 'A-list' restaurant for you? (y/n)"
      random_pick?
    else
      puts ""
      puts "Please enter y for yes or n for no."
      random_pick?
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
      puts "Link to more info: #{pick[index].more_info}"
      puts ""
      @@count += 1
    else
      puts ""
      puts "Sorry, I don't have any more 'A-list' picks."
      a_list?
    end
  end
  
  def goodbye
    puts "No worries. Take care!"
  end
  
  def bon_appetit
    puts "Bon appetit!"
  end
end
