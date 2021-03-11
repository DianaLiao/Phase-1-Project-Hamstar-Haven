class Problem < ActiveRecord::Base
    has_many :solutions
    has_many :activities, through: :solutions

    def self.suggestions_menu(session)
        system "clear"
        options = Problem.all.map { |problem| problem.problem_type }.sort
        
        options.push(" Exit")

        problem_name = session.prompt.select("What do you need help with?") do |menu|
            menu.help "(Use ↑/↓ and ←/→ arrow keys, press Enter to select)"
            menu.show_help :always
            menu.choices options
        end

        current_problem = Problem.find_by(problem_type: problem_name)
        if current_problem == nil
            session.main_menu
        end
        current_problem.view_solutions(session)
    end


    def view_solutions(session)
        prompt = TTY::Prompt.new
        
        options = self.activities.map { |activity| activity.name }.sort
        options.push(" Go back to previous menu")

        activity_choice = prompt.select("Here are some suggested activities to help with that:") do |menu|
            menu.help "(Use ↑/↓ and ←/→ arrow keys, press Enter to select)"
            menu.show_help :always
            menu.choices options
        end

        current_activity = Activity.find_by(name: activity_choice)
        if current_activity == nil
            Problem.suggestions_menu(session)
        end
        
        current_activity.activity_options(session)
    end
end