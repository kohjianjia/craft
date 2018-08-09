class SessionsController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user && user.authenticate(params[:password])
  		# start a session
  			# if user 1 signs in, user 1 starts his session
  		session[:username] = user.id
  		redirect_to root_path, notice: "Welcome back, #{user.username}!"
  	else
      flash[:wrong] = 'Invalid Username and/or Password.'
  		render 'new'
  	end
  end

  def destroy
    # when the session is destroyed, it becomes empty
    session[:username] = nil
    redirect_to sign_in_path, notice: "You've signed out successfully."
  end
end
