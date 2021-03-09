class Interface
    attr_accessor :user
    attr_reader :prompt

    def initialize
        prompt = TTY::Prompt.new
    end

    
    # def ask_for_login_or_register
    #     prompt.select "Would you like to login or register" do |menu|
    #         menu.choice "Login", -> { login_helper }
    #         menu.choice "Register", -> {register_helper}
    #     end
    # end

    # def login_helper
    #     @user = User.login
    # end

    # def register_helper
    #     @user = User.register
    # end
        



    def run
    
    end





end