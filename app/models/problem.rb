class Problem < ActiveRecord::Base
    has_many :solutions
    has_many :activities, through: :solutions

    def self.suggestions_menu(interface_inst)

        options = Problem.all.map { |problem| problem.problem_type }.uniq.sort
        
        options.push("Exit")

        problem_name = interface_inst.prompt.select("What do you need help with?") do |menu|
            menu.help "Press right/left for more options"
            menu.choices options
        end
        # binding.pry
        # if 
        # else

        current_problem = Problem.find_by(problem_type: problem_name)
        current_problem.view_solutions
    end
# end

    def view_solutions
        prompt = TTY::Prompt.new
        
        prompt.select("Here are some suggestions!") do |menu|
            menu.help "Press right/left for more options"
            menu.choices self.activities.map { |activity| activity.name }
        end
    end
end