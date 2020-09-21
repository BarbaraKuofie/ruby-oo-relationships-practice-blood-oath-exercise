require 'pry'
class Follower 
    attr_accessor :name, :age, :life_motto

    @@all = []
   
    def initialize(name, age, life_motto) 
        @name = name
        @age = age 
        @life_motto = life_motto
        @@all << self 
    end 

    def cults 
       BloodOath.all.select{|bloodoath|bloodoath.follower == self}
    end 

   # You cannot join a Cult without making a BloodOath.
    def join_cult(date, cult)
        BloodOath.new(date, cult, self)
    end 

      def self.all 
        @@all 
    end 

    # returns an array of followers who are the given age or older 
    def self.of_a_certain_age(age)
     BloodOath.all.select{|bloodoath|bloodoath.follower.age >= age}
    end 

## created a helper method to get all cults following 
    def cults_following 
        recruited = BloodOath.all.select{|bloodoath| bloodoath.follower == self}.count 
        joined = BloodOath.all.select{|bloodoath| bloodoath.cult == self}.count
        total = joined + recruited
        total
    end 

    ## call the helper method 
    # reverse sort get list in descending order. i'm sure there is a descend method that is best here
    # next print the first 10 
    def self.top_ten
        Follower.all.sort_by{|follower|follower.cults_following}.reverse.first(10)
    end 
end 