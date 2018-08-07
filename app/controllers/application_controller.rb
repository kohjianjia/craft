class ApplicationController < ActionController::Base

	private
	# if the session is successfully created, assign this instance variable
	def current_user
		# if session[:username]
			# if @curent_user 
				# then @curent_user 
			# else 
				# @curent_user = User.find(session[:username])
			# end
		# end
		# thus, ||= means or equal
		@curent_user ||= User.find(session[:username]) if session[:username]
	end

	# enable us to use current_user within Views
	helper_method :current_user

	def authorize
		if current_user.nil?
			redirect_to sign_up_path, alert: 'Please Sign In or Sign Up to proceed'
		end
	end
end
