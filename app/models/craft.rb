class Craft < ApplicationRecord
	belongs_to :user

	def self.search(params)
		crafts = Craft.where("title LIKE ? or host_name LIKE ? or craft_type LIKE ? or city LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
		# then return the crafts that contain the search words
		crafts
	end
end
