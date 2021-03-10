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

 






end

