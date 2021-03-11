class Activity < ActiveRecord::Base
    has_many :user_activities
    has_many :users, through: :user_activities

    has_many :solutions
    has_many :problems, through: :solutions


    def self.browse_all(session)
        system "clear"
        options = Activity.all.map { |activity| activity.name }.sort
        
        options.push(" Exit to Main Menu")
        
        activity_choice = session.prompt.select ("Which activity would you like to look at?").bold do |menu|
            menu.help "(Use ↑/↓ and ←/→ arrow keys, press Enter to select)"
            menu.show_help :always
            menu.choices options
        end

        current_activity = Activity.find_by(name: activity_choice)
        if current_activity == nil
            session.main_menu
        elsif current_activity.class == Activity
            current_activity.activity_options(session)
        end
    end

    def activity_options(session)
        system "clear"
        puts name.colorize(:green).bold
        puts description.italic
        session.prompt.select ("What would you like to do?").bold do |menu|
            menu.choice "Mark this activity as completed", -> {session.user.log_activity(self, session)}
            menu.choice "Save this activity in your Bookmarks", -> {Bookmark.favorite(self, session)}
            menu.choice "Go back to previous menu", -> {Activity.browse_all(session)}
        end
    end
    

end

