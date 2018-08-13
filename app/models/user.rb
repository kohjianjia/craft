class User < ApplicationRecord
	has_secure_password

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

	has_many :crafts, dependent: :destroy

	def self.search_user(params={})
		if params[:search_user].present?
			search(params[:search_user])
		else
			return all
		end
	end

	scope :search, -> (y) { where("username LIKE ?", "%#{y}%") }
	# # equivalent to
	# def self.search(y)
	# 	where("username LIKE ?", "%#{y}%")
	# end
end
