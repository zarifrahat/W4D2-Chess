# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue 
    return nil 
  end 
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError 
  def self.message
    puts "Try feeding the monster coffee!"
  end
end 

class NotFruitCoffeeError < StandardError
  def self.message 
      puts "Ughh! That's gross!"
  end 
end 

def reaction(maybe_fruit)
  if FRUITS.include?(maybe_fruit) 
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    if maybe_fruit != "coffee" 
      raise CoffeeError
    else

    end 
  end
  # elsif maybe_fruit != "coffee"
  #   raise CoffeeError
  # else 
  #   if maybe_fruit == "coffee"
  #   retry
  end

end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"

  begin 
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => e
    CoffeeError.message 
    retry
  rescue NotFruitCoffeeError => e
    NotFruitCoffeeError.message  
  end 
end  

# PHASE 4
class DescriptiveError < StandardError
  def message 
    "Years known must be greater than or equal to 5."
  end 
end 

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name

    @yrs_known = yrs_known
    
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


