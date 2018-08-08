class CraftsController < ApplicationController
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
  		redirect_to craft_path(@craft)
  	else
  		render 'edit'
  	end
  end

  def search
    if params[:search].blank?
      flash[:nothing] = "You searched for nothing!"
      redirect_to crafts_path
    else
      @crafts = Craft.search(params)
    # elsif !params[:search].blank?
    #   @crafts = Craft.search(params)
    # else
    #   flash[:no_match] = "Sorry! No match found."
    #   redirect_back(fallback_location: crafts_path)
    end
  end

  def destroy 
  	@craft = Craft.find(params[:id])
  	@craft.destroy
	redirect_to crafts_path
  end

  private
  def craft_params
  	params.require(:craft).permit(:title, :host_name, :craft_type, :level, :price, :date, :start_time, :end_time, :city, :venue, :description, :inclusive, :phone, :max_participant, :user_id)
  end
end
