class ApplicationController < ActionController::Base

	private
	# this makes the signed in user available to all controllers because this is application_controller
	def current_user
		# if session[:username]
			# if @curent_user 
				# then @curent_user 
			# else 
				# @curent_user = User.find(session[:username])
			# end
		# end
		# thus, ||= means or equal
		# This will return the current user, if they exist
			# if the session is successfully created, assign this instance variable
		@curent_user ||= User.find(session[:username]) if session[:username]
	end

	# enable us to use current_user within Views
	helper_method :current_user

end
