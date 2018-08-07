class HomepageController < ApplicationController
  def index
  	@crafts = Craft.all
  end
end
