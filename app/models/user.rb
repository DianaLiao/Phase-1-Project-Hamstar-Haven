class User < ActiveRecord::Base
    has_many :user_activities
    has_many :activities, through: :user_activities
#    has_many :activities, through: :bookmarks




def self.login
    puts "What is your username ?"
    username = gets.chomp
    if User.find_by(username: username)
    

    end
    
end




end

