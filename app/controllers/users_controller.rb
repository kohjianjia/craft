class UsersController < ApplicationController
	
	before_action :check_rights, only: [:index, :search, :show]
	before_action :admin_only, only: [:index, :search]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			# sign in user immediately after sign up
			session[:username] = @user.id
			flash[:hello] = "Hello, #{@user.username}! You've successfully created an account."
			redirect_to root_path 
		else 
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def search
		@user = User.search_user(params)
		if params[:search_user].blank?
			flash[:nothing] = "You searched for nothing!"
			redirect_back(fallback_location: users_path)
		elsif !@user.empty?
			render 'search'
		else
			flash[:no_match] = "Sorry! No user found."
			redirect_back(fallback_location: users_path)
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

	def check_rights
		if !current_user
		  flash[:no_access] = "Access denied!"
		  redirect_to sign_in_path
		end
	end

	def admin_only
		if !current_user.admin
			flash[:denied_again] = "Access denied! Admin only."
			redirect_to crafts_path
		end
	end

end
