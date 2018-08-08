class Craft < ApplicationRecord
	belongs_to :user

	scope :search, -> (x) { where("title LIKE ? or host_name LIKE ? or craft_type LIKE ? or city LIKE ? or description LIKE ?", "%#{x}%", "%#{x}%", "%#{x}%", "%#{x}%", "%#{x}%") }

end
