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

def self.browse_past_activities(interface_inst)
    user = interface_inst.user

    interface_inst.prompt.select("What would you like to see?") do |menu|
        menu.choice "Activities by frequency", -> {interface_inst.placeholder}
        menu.choice "All activities done", -> {user.activity_log(interface_inst)}
        menu.choice "Return to Main Menu", -> {interface_inst.main_menu}
    end

end

def log_activity(activity, interface_inst)    
    UserActivity.create(user_id: self.id, activity_id: activity.id)
    puts "Excellent work!"

    interface_inst.prompt.select("What would you like to do?") do |menu|
        menu.choice "Return to Main Menu", -> {interface_inst.main_menu}
        menu.choice "Save this activity to your Bookmarks", -> {interface_inst.placeholder}
        menu.choice "Exit app", -> {interface_inst.exit_app}
    end
end

def activity_log(interface_inst)
    user_activities.each do |logged_activity|
        puts "#{logged_activity.activity.name} on #{logged_activity.date}"
    end

    interface_inst.prompt.keypress("Press any key to return to previous menu")
    User.browse_past_activities(interface_inst)

end



end

