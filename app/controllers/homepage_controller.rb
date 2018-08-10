class HomepageController < ApplicationController
  def index
  	@crafts = Craft.all
  end

  def test
  	if params[:hello] == "asd"
  		render "test"
  	else
  		redirect_to root_path
  	end
  end
end
