class Problem < ActiveRecord::Base
    has_many :solutions
    has_many :activities, through: :solutions

    def self.suggestions_menu(interface_inst)

        options = Problem.all.map { |problem| problem.problem_type }.sort
        
        options.push("Exit")

        problem_name = interface_inst.prompt.select("What do you need help with?") do |menu|
            menu.help "Press right/left for more options"
            menu.choices options
        end

        if problem_name == "Exit"
            interface_inst.main_menu
        end

        current_problem = Problem.find_by(problem_type: problem_name)
        current_problem.view_solutions(interface_inst)
    end


    def view_solutions(interface_inst)
        prompt = TTY::Prompt.new
        
        options = self.activities.map { |activity| activity.name }.sort
        options.push("Go back to previous menu")

        activity_choice = prompt.select("Here are some suggestions!") do |menu|
            menu.help "Press right/left for more options"
            menu.choices options
        end

        if activity_choice == "Go back to previous menu"
            Problem.suggestions_menu(interface_inst)
        end

        current_activity = Activity.find_by(name: activity_choice)
        current_activity.activity_options(interface_inst)
    end
end