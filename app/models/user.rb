class User < ActiveRecord::Base
    has_many :user_activities
    has_many :activities, through: :user_activities
#    has_many :activities, through: :bookmarks


def self.login
    puts " Please enter your username: "
    username = gets.chomp
    puts " Please enter your password: "
    password = gets.chomp
    user = User.find_by(username: username, password: password)
    until user
        # system "clear"
        puts " Incorrect username or password"
        user = User.login
    end
    user
end

# def self.register
#     puts " Please enter your username: "
#     username = gets.chomp
#     puts " Please enter your password: "
#     password = gets.chomp
#     user = User.create(usename: username, password: password)
# end



end

