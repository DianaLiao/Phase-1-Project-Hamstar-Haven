class Bookmark < ActiveRecord::Base
    belongs_to :user
    belongs_to :activity


    def self.favorite(activity,session)
        user = session.user
        bookmark = Bookmark.find_by(user_id: user.id, activity_id: activity.id)
        if bookmark
            puts "You have already bookmarked this activity!"
            session.prompt.keypress("Press any key to return to Activities list")
            Activity.browse_all(session)
        else 
            bookmark = Bookmark.create(user_id: user.id, activity_id: activity.id)
            puts "Bookmark saved!"
            activity.bookmark_options(session,bookmark)
        end
    end








    


 






end

