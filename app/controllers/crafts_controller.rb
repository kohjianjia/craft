class CraftsController < ApplicationController

  before_action :create_rights, only: [:new, :create, :update, :edit, :show]
  before_action :check_update_rights, only: [:update, :edit]
  before_action :specific_search, only: [:search]

  def index
  	@crafts = Craft.all
  end

  def show
  	@craft = Craft.find(params[:id])
  end

  def new
  	@craft = Craft.new
  end

  def create
  	@craft = Craft.new(craft_params)
  	@craft.user_id = current_user.id
  	if @craft.save
  		redirect_to craft_path(@craft)
  	else
  		render 'new'
  	end
  end

  def edit
  	@craft = Craft.find(params[:id])
  end

  def update
  	@craft = Craft.find(params[:id])
  	if @craft.update(craft_params)
      respond_to do |format|
        format.html { redirect_to craft_path(@craft) }
        format.js
        # format.json { render json: @craft }
      end
  	else
  		render 'edit'
  	end
  end

  def save_location
    @craft = Craft.find(params[:id])
    if @craft.update(current_location)
      flash[:location_saved] = "Location saved!"
      render json: true
    end
  end

  def search
    # if params[:search].blank?
    if params[:find_word].blank?
      flash[:nothing] = "You searched for nothing!"
      redirect_to crafts_path
    elsif !@crafts.empty?
      render 'search'
    else
      flash[:no_match] = "Sorry! No match found."
      redirect_back(fallback_location: crafts_path) 
    end
  end

  def destroy 
  	@craft = Craft.find(params[:id])
  	@craft.delete

    respond_to do |format|
      # corresponds to views/crafts/destroy.js.erb
      format.js
    end
	  # redirect_to crafts_path
  end

  private
  def craft_params
  	params.require(:craft).permit(:title, :host_name, :craft_type, :level, :price, :date, :start_time, :end_time, :city, :venue, :description, :inclusive, :phone, :max_participant, :availability, :user_id)
  end

  def create_rights
    if !current_user
      flash[:not_account] = "Please sign in or sign up to proceed."
      redirect_to sign_in_path
    end
  end

  def check_update_rights
    @craft = Craft.find(params[:id])
    if current_user.id != @craft.user_id || current_user.admin? 
      flash[:denied] = "Access denied!"
      redirect_to crafts_path
    end
  end

  def specific_search
    @crafts = Craft.all
    #                  search is from the form at application.html.erb where name="find_word"
    @crafts = @crafts.search(params[:find_word]) if params[:find_word].present?
  end

  def current_location
    params.permit(:latitude, :longitude)
  end
end






