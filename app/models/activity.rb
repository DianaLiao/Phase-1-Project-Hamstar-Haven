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
            menu.choice "Mark this activity as completed", -> {complete_activity_helper(session)}
            menu.choice "Save this activity in your Bookmarks", -> {save_bookmark_helper(session)}
            menu.choice "Go back to previous menu", -> {Activity.browse_all(session)}
        end
    end

    def bookmark_options(session)
        session.prompt.select ("What would you like to do?").bold do |menu|
            menu.choice "Today is D Day. Lets do it !!!", -> {complete_activity_helper(session)}
            menu.choice "Go to your Bookmarks list", -> {session.user.show_favorites(session)}
            menu.choice "Go to Activities list", -> {Activity.browse_all(session)}
            menu.choice "Return to Main Menu", -> {session.main_menu}
            menu.choice "Remove from your Bookmarks", -> {session.user.remove_bookmark(session)}
        end
    end
    
    def complete_activity_helper(session)
        session.user.log_activity(self, session)
    end

    def save_bookmark_helper(session)
        Bookmark.favorite(self, session)
    end


end

