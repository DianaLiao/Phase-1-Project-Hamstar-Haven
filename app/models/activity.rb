class Activity < ActiveRecord::Base
    has_many :user_activities
    has_many :users, through: :user_activities

    has_many :solutions
    has_many :problems, through: :solutions


    


end

