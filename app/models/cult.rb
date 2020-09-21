class Cult 
    attr_accessor :name, :location, :founding_year, :slogan, :follower

    @@all = []

    def initialize(name,location, founding_year, slogan)
        @name = name 
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self 
    end 
## You cannot join a Cult without making a BloodOath!!!
    def recruit_follower(date,follower)
        BloodOath.new(date, self, follower) 
    end 

## followers joined through being recruited or by themselves 
    def cult_population 
       by_recruite = BloodOath.all.select{|bloodoath| bloodoath.cult == self}.count 
       by_joining = BloodOath.all.select{|bloodoath| bloodoath.follower == self}.count
       total = by_joining + by_recruite
       total 
    end 

    def self.all 
        @@all 
    end 
## this is to return just one instance 
    def self.find_by_name(name)
        self.all.find{|cult| cult.name == name}
    end 

    ## this is to return all cults that are in the location in an array 
    def self.find_by_location(location)
        self.all.select{|cult| cult.location == location}
    end 

## this is to return all the cults that are founded in a specific year 
    def self.find_by_founding_year(founding_year)
        @@all.select{|cult|cult.founding_year == founding_year}
    end 
## since we have cult population, we can use that as the denominator 
    def average_age 
        total_age = BloodOath.all.map{|bloodoath|bloodoath.follower.age}.sum 
        average_age = total_age/cult_population
        average_age.to_f
    end 

    ## we want to return a changed array 
    def my_followers_mottos 
        BloodOath.all.map{|bloodoath|bloodoath.follower.life_motto}
    end 
## for my own sanity, i added .name to see the output name 
    def self.least_popular 
        Cult.all.sort_by{|cult| cult.cult_population}.first.name 
    end 

## added name for my own sanity. so the output is something i recognize
    def self.most_active 
        Cult.all.sort_by{|cult|cult.cult_population}.last.name 
    end 
end 