class Craft < ApplicationRecord
	belongs_to :user

	def self.search_workshop(params={})
		if params[:search_workshop].present?
			search(params[:search_workshop])
		else
			return all
		end
	end

	scope :search, -> (x) { where("title LIKE ? or host_name LIKE ? or craft_type LIKE ? or city LIKE ? or description LIKE ?", "%#{x}%", "%#{x}%", "%#{x}%", "%#{x}%", "%#{x}%") }
end
