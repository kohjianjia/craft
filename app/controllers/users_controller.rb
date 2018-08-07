class UsersController < ApplicationController
	def index
	end

	def new
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			# sign in user immediately after sign up
			session[:username] = @user.id
			redirect_to homepage_path, notice: "Hello, #{@user.username}! You've successfully created an account."
		else 
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
