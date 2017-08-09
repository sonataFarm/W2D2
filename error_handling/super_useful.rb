class CoffeeError < StandardError
end

# PHASE 2
def convert_to_int(str)

  Integer(str)

rescue ArgumentError => e
   nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif coffee?(maybe_fruit)
    raise CoffeeError
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError
    retry
  rescue
    puts "No friut and no coffee:("

  end
end

def coffee?(coffee)
  coffee.downcase == 'coffee'
end

class FriendshipError < StandardError

end


# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
    raise FriendshipError if yrs_known < 5
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  rescue FriendshipError
    puts "#{yrs_known} years!, you call that a friend"
    return nil
  end

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
