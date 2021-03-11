class Bookmark < ActiveRecord::Base
    belongs_to :user
    belongs_to :activity


    def self.favorite(activity,session)
        user = session.user
        bookmark = Bookmark.find_by(user_id: user.id, activity_id: activity.id)
        if bookmark
            puts " You have already saved this activity to your list!"
        else 
            bookmark = Bookmark.create(user_id: user.id, activity_id: activity.id)
        end
        
        #lets do it later!!!
    end


    def bookmark_options(session) 
        session.prompt.select("What would you like to do?") do |menu|
            menu.choice "Today is D Day. Lets do it !!!", ->{session.user.log_activity(activity,session)}
            menu.choice "Go back to Activities list", -> {Activity.browse_all(session)}
            menu.choice "Go back to your Bookmarks list", ->{session.user.show_favorites(session)}
            menu.choice "Remove from your bookmark", ->{session.user.remove_bookmark(session)}
        end
    end

    


 






end

