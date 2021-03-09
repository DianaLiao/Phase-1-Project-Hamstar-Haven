class User < ActiveRecord::Base
    has_many :user_activities
    has_many :activities, through: :user_activities
    has_many :bookmarks
    has_many :favorites, through: :bookmarks, source: :activity


def self.login (interface_inst)

    username = interface_inst.prompt.ask("Please enter your username:")
    password = interface_inst.prompt.mask("Please enter your password:")

    user = User.find_by(username: username, password: password)

    until user 
        # system "clear"
        puts "Incorrect username or password"
        user = User.login (interface_inst)
    end
    user
end

def self.register(interface_inst)
    username = interface_inst.prompt.ask("Please enter your desired username:")
    user = User.find_by(username: username)

    until !user
        puts "Sorry this username has been taken. Please chooose another one!"
        user = User.register(interface_inst)
    end

    password = interface_inst.prompt.mask("Please enter your password:")

    # password_confirm = interface_inst.prompt.mask("Please confirm your password:")

    # until password == password_confirm
    #     puts "Your passwords did not match. Please try registration again."
    #     User.register(interface_inst)
    # end

    name = interface_inst.prompt.ask("What would you like to be called?")

    new_user = User.create(username: username, password: password, name: name)
    interface_inst.user = new_user
end



end

