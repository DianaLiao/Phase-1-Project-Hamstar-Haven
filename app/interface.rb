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
        puts "Hello, #{user.name}! What would you like to do?"
        prompt.select "Would you like to login or register?" do |menu|
            menu.choice "Browse your bookmarked activities", -> {}
            menu.choice "Browse all activities", -> {browse_all_helper}
            menu.choice "Browse your past activity log", -> {}
            menu.choice "View suggestions based on what's bothering you", -> {suggestions_menu_helper}
            menu.choice "Exit", -> {exit_app}
        end
    end
        
    def browse_all_helper
        Activity.browse_all(self)
    end

    def suggestions_menu_helper
        Problem.suggestions_menu(self)
    end


    def exit_app
        puts "See you again soon!"
    end

    



end