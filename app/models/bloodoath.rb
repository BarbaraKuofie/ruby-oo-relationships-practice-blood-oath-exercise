class BloodOath 
    attr_reader :initiation_date, :cult
    attr_accessor :follower 

    @@all = []
    ## in order to have a bloodoath, you need a cult and a follower
    def initialize(date, cult, follower) 
        @initiation_date =date
        @cult = cult 
        @follower = follower  
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def self.first_oath
        self.all.first.follower 
    end 
end 
