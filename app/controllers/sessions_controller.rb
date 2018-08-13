class SessionsController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    # if the user exists and the password entered is correct
      # .authenticate checks if password is correct
    if user && user.authenticate(params[:password])
  		# start a session
        # assign the current user id to a session
  			# if user 1 signs in, user 1 starts his session
          # Save the user id inside the browser cookie to keep the user logged in when he navigates around the app
  		session[:username] = user.id
      flash[:welcome] = "Welcome back, #{user.username}!"
  		redirect_to root_path
  	else
      flash[:wrong] = 'Invalid Username and/or Password.'
  		render 'new'
  	end
  end

  def destroy
    # kill a session when a user chooses to logout
    # when the session is destroyed, it becomes empty (nil)
    session[:username] = nil
    flash[:logout] = "You've successfully signed out."
    redirect_to sign_in_path
  end
end
