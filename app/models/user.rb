class User < ActiveRecord::Base
    has_many :user_activities
    has_many :activities, through: :user_activities
    has_many :bookmarks
    has_many :favorites, through: :bookmarks, source: :activity


def self.login
    prompt = TTY::Prompt.new
    username = prompt.ask("Please enter your username:")
    password = prompt.mask("Please enter your password:")

    user = User.find_by(username: username, password: password)

    until user 
        # system "clear"
        puts "Incorrect username or password"
        user = User.login 
    end
    user
end

def self.register
    prompt = TTY::Prompt.new
    username = prompt.ask("Please enter your desired username:")
    user = User.find_by(username: username)

    until !user
        puts "Sorry this username has been taken. Please chooose another one!"
        user = User.register
    end

    password = prompt.mask("Please enter your password:")

    # password_confirm = prompt.mask("Please confirm your password:")

    # until password == password_confirm
    #     puts "Your passwords did not match. Please try registration again."
    #     User.register(interface_inst)
    # end

    name = prompt.ask("What would you like to be called?")

    new_user = User.create(username: username, password: password, name: name)
end

def self.browse_past_activities(session)
    user = session.user

    session.prompt.select("What would you like to see?") do |menu|
        menu.choice "Activities by frequency", -> {session.placeholder}
        menu.choice "All activities done", -> {user.activity_log(session)}
        menu.choice "Return to Main Menu", -> {session.main_menu}
    end

end

def log_activity(activity, session)    
    UserActivity.create(user_id: self.id, activity_id: activity.id)
    puts "Excellent work!"

    session.prompt.select("What would you like to do?") do |menu|
        menu.choice "Return to Main Menu", -> {session.main_menu}
        menu.choice "Save this activity to your Bookmarks", -> {session.placeholder}
        menu.choice "Exit app", -> {session.exit_app}
    end
end

def activity_log(session)
    user_activities.each do |logged_activity|
        puts "#{logged_activity.activity.name} on #{logged_activity.date}"
    end

    session.prompt.keypress("Press any key to return to previous menu")
    User.browse_past_activities(session)

end



end

