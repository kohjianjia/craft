class HomepageController < ApplicationController
  def index
  	@crafts = Craft.all
  end

  def faq
  end
end
