class Activity < ActiveRecord::Base
    has_many :user_activities
    has_many :users, through: :user_activities

    has_many :solutions
    has_many :problems, through: :solutions


    def self.browse_all(interface_inst)
        interface_inst.prompt.select("Which activity would you like to look at?") do |menu|
            menu.help "Press right/left for more options"
            menu.choices Activity.all.map { |activity| activity.name }
        end
    end


end

