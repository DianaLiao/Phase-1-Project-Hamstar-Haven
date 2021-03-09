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
            menu.choice "Browse all activities", -> {}
            menu.choice "Browse your past activity log", -> {}
            menu.choice "View suggestions based on what's bothering you", -> {}
            menu.choice "Exit", -> {exit_app}
        end
    end
        
    def exit_app
        puts "See you again soon!"
    end

    



end