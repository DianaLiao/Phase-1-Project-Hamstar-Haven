class User < ActiveRecord::Base
    has_many :user_activities
    has_many :activities, through: :user_activities
    has_many :bookmarks
    has_many :favorites, through: :bookmarks, source: :activity


    def self.login(session)
        username = session.prompt.ask("Please enter your username:")
        password = session.prompt.mask("Please enter your password:")

        user = User.find_by(username: username, password: password)

        until user 
            puts "Incorrect username or password"
            user = User.login(session)
        end
        user
    end

    def self.register(session)
        username = session.prompt.ask("Please enter your desired username:")
        user = User.find_by(username: username)

        until !user
            puts "Sorry this username has been taken. Please chooose another one!"
            user = User.register(session)
        end

        password = session.prompt.mask("Please enter your password:")

        # Unsuccesful password confirm feature - bugs when password does not match before eventually matching
        # password_confirm = session.prompt.mask("Please confirm your password:")

        # until password == password_confirm
        #     puts "Your passwords did not match. Please try registering again."
        #     user = User.register(session)
        # end

        name = session.prompt.ask("What would you like to be called?")

        user = User.create(username: username, password: password, name: name)
    end

    def browse_past_activities(session)
        system "clear"

        session.prompt.select ("What would you like to see?").bold do |menu|
            menu.choice "Number of each activity completed", -> {activities_by_frequency(session)}
            menu.choice "Log of all past activities", -> {activities_log(session)}
            menu.choice "Return to Main Menu", -> {session.main_menu}
            menu.choice "Delete all previously logged activities", -> {delete_log_helper(session)}
        end

    end

    def log_activity(activity, session)    
        UserActivity.create(user_id: self.id, activity_id: activity.id)
        
        accolades = ["Excellent work!", "Great job!", "High-five!", "Self-care ftw!"]
        puts accolades.sample

        session.prompt.select ("What would you like to do?").bold do |menu|
            menu.choice "Save this activity to your Bookmarks", -> {save_bookmark_helper(activity,session)}
            menu.choice "See your Bookmarks", -> {show_favorites(session)}
            menu.choice "Return to Main Menu", -> {session.main_menu}
            menu.choice "Exit app", -> {session.exit_app}
        end
    end

    def save_bookmark_helper(activity, session)
        Bookmark.favorite(activity,session)
    end

    def delete_log_helper(session)
        answer = session.prompt.yes?("Are you sure you would like to delete your past logged activities? This cannot be undone.")
        if answer == true
            user_activities.destroy_all
        end
        
        session.main_menu
        
    end

    def activities_log(session)
        reload
        user_activities.each do |log_entry|
            puts "#{log_entry.activity.name} on #{log_entry.created_at.to_date}"
        end

        session.prompt.keypress("Press any key to return to previous menu")
        browse_past_activities(session)

    end

    def activities_by_frequency(session)
        reload
        activity_count = activities.group(:name).count
        list = activity_count.sort_by{|activity, count| count}.reverse
        list.each do |list_pair|
            puts "#{list_pair[0]} -> #{list_pair[1]}".italic
        end
        session.prompt.keypress("Press any key to return to previous menu")
        browse_past_activities(session)
    end

    def show_favorites(session)
        reload
        options = self.favorites.map {|activity| activity.name}.sort.uniq
        options.push(" Exit to main menu")
        bookmark_choice = session.prompt.select ("Which bookmarked activity would you like to look at?").bold do |menu|
            menu.help "(Use ↑/↓ and ←/→ arrow keys, press Enter to select)"
            menu.show_help :always
            menu.choices options
        end
        
        activity = Activity.find_by(name: bookmark_choice)
        
        if activity == nil 
            session.main_menu
        elsif activity.class == Activity
            current_bookmark = Bookmark.find_by(user_id: self.id, activity_id: activity.id)
            activity.bookmark_options(session,current_bookmark)
        end

    end


    def remove_bookmark(session,bookmark)
        delete = session.prompt.yes?("Are you sure you want to remove this activity from your bookmark?") 
        if delete == true
            Bookmark.destroy(bookmark.id)
        end
            show_favorites(session)
    end


    def view_profile(session)
        puts "Name: #{name}"
        puts "Avatar: #{avatar}"
        puts "Motto: #{motto}"
        puts "Happy Place (URL): #{happy_url}"

        choice = session.prompt.select "What would you like to do?" do |menu|
            menu.choice "Edit your profile", -> {profile_editor(session)}
            menu.choice "Go back to the Main Menu", -> {session.main_menu}
        end

    end

    def profile_editor(session)
        session.prompt.select "What would you like to change?" do |menu|
            menu.choice "Name", -> {name_helper(session)}
            menu.choice "Avatar", -> {avatar_helper(session)}
            menu.choice "Motto", -> {motto_helper(session)}
            menu.choice "Happy Place (URL):", -> {happy_place_helper(session)}
            menu.choice "Nevermind", -> {session.main_menu}
        end
    end

    def name_helper(session)
        new_name = session.prompt.ask "Your current name is #{name}. What would you like to be called?"
        update(name: new_name)
        puts "Great, we'll call you #{name}!"
        view_profile(session)
    end
    
    def avatar_helper(session)
        new_avatar = session.prompt.ask "Your current avatar is #{avatar}. What represents you today?"
        update(avatar: new_avatar)
        puts "#{avatar} suits you!"
        view_profile(session)
    end

    def motto_helper(session)
        new_motto = session.prompt.ask "Your current motto is: \n#{motto}. \nWhat is your motto today?"
        update(motto: new_motto)
        puts "#{motto} \n Wise words!"
        view_profile(session)
    end

    def happy_place_helper(session)
        new_happy_url = session.prompt.ask "Your current happy place is #{happy_url}.\nWhere should we take you to relax?"
        update(happy_url: new_happy_url)
        puts "#{happy_url} is a great web page!"
        view_profile(session)
    end



end

