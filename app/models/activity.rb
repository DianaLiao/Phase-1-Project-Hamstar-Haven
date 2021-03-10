class Activity < ActiveRecord::Base
    has_many :user_activities
    has_many :users, through: :user_activities

    has_many :solutions
    has_many :problems, through: :solutions


    def self.browse_all(session)
        system "clear"
        options = Activity.all.map { |activity| activity.name }.sort
        
        options.push("Exit to Main Menu")
        
        activity_choice = session.prompt.select("Which activity would you like to look at?") do |menu|
            menu.help "Press right/left for more options"
            menu.choices options
        end

        if activity_choice == "Exit to Main Menu"
            session.main_menu
        end

        current_activity = Activity.find_by(name: activity_choice)
        current_activity.activity_options(session)
    end

    def activity_options(session)
        system "clear"
        prompt = TTY::Prompt.new
        puts self.description
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Mark this activity as done", -> {session.user.log_activity(self, session)}
            menu.choice "Save this activity later in your bookmarks", -> {Bookmark.favorite(self, session)}
            menu.choice "Go back to Activities list", -> {Activity.browse_all(session)}
        end

    end



end

