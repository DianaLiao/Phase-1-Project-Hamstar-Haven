class Activity < ActiveRecord::Base
    has_many :user_activities
    has_many :users, through: :user_activities

    has_many :solutions
    has_many :problems, through: :solutions


    def self.browse_all(interface_inst)

        options = Activity.all.map { |activity| activity.name }.sort
        
        options.push("Exit to Main Menu")
        
        activity_choice = interface_inst.prompt.select("Which activity would you like to look at?") do |menu|
            menu.help "Press right/left for more options"
            menu.choices options
        end

        if activity_choice == "Exit to Main Menu"
            interface_inst.main_menu
        end

        current_activity = Activity.find_by(name: activity_choice)
        current_activity.activity_options(interface_inst)
    end

    def activity_options(interface_inst)
        prompt = TTY::Prompt.new
        puts self.description
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Mark this activity as done", -> {interface_inst.user.log_activity(self, interface_inst)}
            menu.choice "Save this activity later in your bookmarks", -> {interface_inst.placeholder}
            menu.choice "Go back to Activities list", -> {Activity.browse_all(interface_inst)}
        end

    end



end

