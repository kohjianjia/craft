class CraftsController < ApplicationController

  before_action :ajax_search, only: [:search]

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

  def ajax_search
    @crafts = Craft.all
    #                  search is from the form at applicaition.html.erb where name="search"
    @crafts = @crafts.search(params[:find_word]) if params[:find_word].present?
  end
end






