require 'rails_helper'
require 'byebug'

RSpec.describe User, type: :model do

	# has_secure_password adds 2 fields, password and password_confirmation to user model
	it "should must have password" do
		user = User.new(username: "Bob", email:"bob@email.com")
		expect(user).to_not be_valid
	end

	it "should have password" do
		user = User.create(username: "Bob", password: 'short', password_confirmation: 'short', email:"bob@email.com")
		expect(user).to be_valid
	end

	it "should must have password_confirmation" do
		user = User.new(username: "Bob", password: 'short', password_confirmation: 'long', email:"bob@email.com")
		expect(user).to_not be_valid
	end

	it "should have password_confirmation" do
		user = User.new(username: "Bob", password: 'short', password_confirmation: 'short', email:"bob@email.com")
		expect(user).to be_valid
	end

	it "is not valid with same username" do
		user1 = User.create(username: "Bob", password:"uiop7890", email:"bob1@email.com")
		user2 = User.new(username: "Bob", password:"uiop7890", email:"bob2@email.com")
		expect(user2).to_not be_valid
	end

	it "is valid only with unique username" do
		user1 = User.create(username: "Bob1", password:"uiop7890", email:"bob1@email.com")
		user2 = User.new(username: "Bob2", password:"uiop7890", email:"bob2@email.com")
		expect(user2).to be_valid
	end

	it "is not valid only with same email" do
		user1 = User.create(username: "Bob1", password:"uiop7890", email:"bob@email.com")
		user2 = User.new(username: "Bob2", password:"uiop7890", email:"bob@email.com")
		expect(user2).to_not be_valid
	end

	it "is valid only with unique email" do
		user1 = User.create(username: "Bob1", password:"uiop7890", email:"bob1@email.com")
		user2 = User.new(username: "Bob2", password:"uiop7890", email:"bob2@email.com")
		expect(user2).to be_valid
	end

	it "should have a username" do
		user = User.new(password:"uiop7890", email:"bob1@email.com")
		expect(user).to_not be_valid
	end

	it "should have a username" do
		user = User.new(username: "Bob1", password:"uiop7890", email:"bob1@email.com")
		expect(user).to be_valid
	end

	it "should have a email" do
		user = User.new(username: "Bob1", password:"uiop7890")
		expect(user).to_not be_valid
	end

	it "should have a email" do
		user = User.new(username: "Bob1", password:"uiop7890", email:"bob1@email.com")
		expect(user).to be_valid
	end

	it "should not belongs to crafts" do 
		#            this tests for association, which will return information about the given association
		user1 = User.reflect_on_association(:crafts)
		#            set expectations on the result through the .macro method
		expect(user1.macro).to_not eq(:belongs_to)
	end

	it "should have many crafts" do 
		user1 = User.reflect_on_association(:crafts)
		expect(user1.macro).to eq(:has_many)
	end

	it "should have dependent: :destroy" do
		user1 = User.create(username: "Bob1", password:"uiop7890", email:"bob1@email.com")
		craft1 = Craft.create(title: "ABC", user: user1)
		craft2 = Craft.create(title: "DEF", user: user1)
		expect { user1.destroy }.to change { Craft.count }.by(-2)
	end

	# test for custom model (search_user) method
	it "should return search user results" do
		user = User.create(username: "Bob", password: 'short', password_confirmation: 'short', email:"bob@email.com")
		@result = User.search_user(search_user: "Bob")
		expect(@result).to eq([user])
	end

	it "should return search user results" do 
		@result = User.search_user(search_user: "Bob")
		expect(@result).to eq([])
	end

end