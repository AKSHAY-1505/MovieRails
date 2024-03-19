class ApplicationController < ActionController::Base
    helper_method :is_root

    private 

    def is_root
        if user_signed_in? and current_user.email == "root@movierails.com"
    
        else
            redirect_to root_path , flash: {alert: "Not Authorized!"}
        end
    end
end
