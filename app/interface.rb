class Interface
    attr_accessor :user
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def run
        welcome
        ask_for_login_or_register
        main_menu
    end

    def welcome
        puts "Welcome! ヽ(´▽`)/ "
    end

    def ask_for_login_or_register
        prompt.select "Would you like to login or register?" do |menu|
            menu.choice "Login", -> {login_helper}
            menu.choice "Register", -> {register_helper}
        end
    end

    def login_helper
        @user = User.login(self)
    end

    def register_helper
        @user = User.register(self)
    end

    def main_menu
        system "clear"
        puts "Hello, #{user.name}! What would you like to do?"
        prompt.select "Here are your choices:" do |menu|
            menu.choice "Browse your bookmarked activities", -> {placeholder}
            menu.choice "Browse all activities", -> {browse_all_helper}
            menu.choice "Browse your past activity log", -> {browse_past_activities_helper}
            menu.choice "View suggestions based on what's bothering you", -> {suggestions_menu_helper}
            menu.choice "Exit", -> {exit_app}
        end
    end
        
    def browse_past_activities_helper
        User.browse_past_activities(self)
    end

    def browse_all_helper
        Activity.browse_all(self)
    end

    def suggestions_menu_helper
        Problem.suggestions_menu(self)
    end

    def placeholder
        puts "Coming soon..."
        prompt.keypress("Press any key to return to main menu")
        main_menu
    end

    def exit_app
        puts "See you again soon!"
    end

    



end