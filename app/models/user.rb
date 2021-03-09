class User < ActiveRecord::Base
    has_many :user_activities
    has_many :activities, through: :user_activities
#    has_many :activities, through: :bookmarks


def self.login
    puts " Please enter your username: "
    username = STDIN.gets.chomp
    puts " Please enter your password: "
    password = STDIN.gets.chomp
    user = User.find_by(username: username, password: password)
    until user
        # system "clear"
        puts " Incorrect username or password"
        user = User.login
    end
    user
end

def self.register
    puts " Please enter your username: "
    username = STDIN.gets.chomp
    user = User.find_by(username: username)
    until !user
        puts " Sorry this username has been taken. Please chooose another one !"
        user = User.register
    end
    puts " Please enter your password: "
    password = STDIN.gets.chomp
    puts " What would you like to be called ?"
    name = STDIN.gets.chomp
    user = User.create(name: name, username: username, password: password)
    puts "Hello #{name}"
end



end

