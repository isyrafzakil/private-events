class ApplicationController < ActionController::Base

	# def current_user
 #        user_id = cookies[:user_id]
 #        if user_id
 #            begin
 #                @current_user = User.find(user_id)
 #            rescue ActiveRecord::RecordNotFound
 #                redirect_to new_user_path, flash: {warning: "User not found, Create a user!"}                
 #            end
 #        else
 #            redirect_to sign_in_users_path, flash: {info: "Please Login!"}
 #        end
        
 #    end

 	before_action :configure_permitted_parameters, if: :devise_controller?

  	protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

	    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    		user_params.permit(:username, :email)
  		end
	  end


end
