require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# each instance should product these (name,location, founding_year, slogan)
cult1 = Cult.new("cult1", "Washington DC", "2016", "make america great again")
cult2 = Cult.new("cult2", "Slovenia", "1963", "be best")
cult3 = Cult.new("cult3", "Washington DC", "2016", "alternative facts" )

## this should return the two cult instances 
#puts cult1
#puts cult2 

# each follower instance is initialized with
# (name, age = 0, life_moto)
follower1 = Follower.new("Tom", 26, "alt-right")
follower2 = Follower.new("Karen", 42, "I need to talk to your manager")
follower3 = Follower.new("Chad", 32, "Pump it")

#puts follower1 
#puts follower2 

##follower.cults returns an array of the followers cult 
#puts follower2.cults

## recruiting followers should should add these folloers to the cult

 cult1.recruit_follower("2016-01-01", follower3) 
 cult1.recruit_follower("199-02-02", follower1)
 cult2.recruit_follower("2020-07-02", follower2)

 ## joining a cult should turn give these followers a cult 
 follower1.join_cult("2020-5-08", cult2)
 follower2.join_cult("1980-04-19", cult1)

## cult.population should return  
puts cult1.cult_population ##3
puts cult2.cult_population ##2 

## takes a string argument that is a name and returns a cult instance whose 
#name matches that arguement 
puts Cult.find_by_name("cult1")

## takes a string argument that is a location and returns an array of cults that are
## in the location.. pay attention to returns an array

puts Cult.find_by_location("Washington DC")

## return all cults by finding year 
puts Cult.find_by_founding_year("2016")


## return an array of this follower's cults
puts follower3.cults 

## returns followers above a certain age 
puts Follower.of_a_certain_age(32)

## returns average of a particular cults followers
puts cult1.average_age 

## prints out all of the mottos for this cults followers 
puts cult1.my_followers_mottos

## prints the least popular 
puts Cult.least_popular 

## prints the most active cult 
puts Cult.most_active 

# returns an array of followers; they are the top ten most active 
puts Follower.top_ten

## this is to test the first oath taker 
puts BloodOath.first_oath

binding.pry 
puts "Mwahahaha!" # just in case pry is buggy and exits
