class Problem < ActiveRecord::Base
    has_many :solutions
    has_many :activities, through: :solutions

    def self.suggestions_menu(session)
        system "clear"
        options = Problem.all.map { |problem| problem.problem_type }.sort
        
        options.push(" Exit")

        problem_name = session.prompt.select ("What do you need help with?").bold do |menu|
            menu.help "(Use ↑/↓ and ←/→ arrow keys, press Enter to select)"
            menu.show_help :always
            menu.choices options
        end

        current_problem = Problem.find_by(problem_type: problem_name)
        if current_problem == nil
            session.main_menu
        elsif current_problem.class == Problem
            current_problem.view_solutions(session)
        end
    end


    def view_solutions(session)
        options = self.activities.map { |activity| activity.name }.sort
        options.push(" Go back to previous menu")

        activity_choice = session.prompt.select ("Here are some suggested activities to help with that:").bold do |menu|
            menu.help "(Use ↑/↓ and ←/→ arrow keys, press Enter to select)"
            menu.show_help :always
            menu.choices options
        end

        current_activity = Activity.find_by(name: activity_choice)
        if current_activity == nil
            Problem.suggestions_menu(session)
        elsif current_activity.class == Activity
            current_activity.activity_options(session)
        end
    end
end