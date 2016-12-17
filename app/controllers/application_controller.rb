class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	private
  
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
	end

	def access_denied(exception)
		flash[:danger] = exception.message
		redirect_to root_url
	end
	
end
