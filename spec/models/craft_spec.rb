require 'rails_helper'
require 'byebug'

RSpec.describe Craft, type: :model do

	it "should not have many users" do 
		#            this tests for association, which will return information about the given association
		craft = Craft.reflect_on_association(:user)
		#            set expectations on the result of the .macro method
		expect(craft.macro).to_not eq(:has_many)
	end

	it "should belong to a user" do 
		craft = Craft.reflect_on_association(:user)
		expect(craft.macro).to eq(:belongs_to)
	end

	# test for custom model (search_workshop) method
	it "should return search craft results" do
		user = User.create(username: "Bob1", password: 'short', password_confirmation: 'short', email:"bob1@email.com")
		craft = Craft.create(title: "Opela", host_name: "German Bayer", craft_type: "Wood carving", level: "Beginner", price: 521.0, date: "2018-08-18", start_time: "11am", end_time: "4pm", city: "Port Tristan", venue: "7315 Dallas Plains, Pacochahaven, MT 73782", description: "Et enim magnam. Saepe placeat consectetur.", inclusive: "Repudiandae deserunt non. Nisi dolores eum.", phone: "1-581-923-6291", max_participant: 15, user_id: user.id, availability: true, latitude: 37.468886279787355, longitude: 78.67861497043032)
		@result = Craft.search_workshop(search_workshop: "Opela")
		expect(@result.count).to eq(1)
	end

	it "should return search craft results" do
		@result = Craft.search_workshop(search_workshop: "Opela")
		expect(@result.count).to eq(0)
	end

end