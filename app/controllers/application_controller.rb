class ApplicationController < ActionController::Base
    helper_method :root_only

    private 

    def root_only
        if user_signed_in? && current_user.email == "root@movierails.com"
    
        else
            redirect_to root_path , flash: {danger: "Not Authorized!"}
        end
    end
end
