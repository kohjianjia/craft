# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Seed Users
user = {}
user['password'] = 'uiop7890'
user['password_confirmation'] = 'uiop7890'

ActiveRecord::Base.transaction do
  15.times do 
    user['username'] = Faker::Name.name 
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

# Seed Crafts
craft = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  50.times do 
    craft['title'] = Faker::App.name
    craft['host_name'] = Faker::Name.name
    craft['craft_type'] = ["Embroidery", "Macrame", "Knitting", "Crochet", "Leather crafting", "Batik", "Origami", "Bookbinding", "Calligraphy", "Wood carving"].sample
    craft['level'] = ["Beginner", "Intermediate", "Advanced"].sample
    craft['price'] = rand(100..1000)
    craft['date'] = ["18th August 2018", "19th August 2018", "25th August 2018", "26th August 2018", "1st September 2018", "2nd September 2018", "8th September 2018", "9th September 2018"].sample
    craft['start_time'] = ["11am"].sample
    craft['end_time'] = ["4pm"].sample
    craft['city'] = Faker::Address.city
    craft['venue'] = Faker::Address.full_address
    craft['latitude'] = Faker::Address.latitude
    craft['longitude'] = Faker::Address.longitude
    craft['description'] = Faker::Lorem.paragraph_by_chars(500, false)
    craft['inclusive'] = Faker::Lorem.paragraph
    craft['phone'] = Faker::PhoneNumber.cell_phone
    craft['max_participant'] = rand(4..15)

    craft['user_id'] = uids.sample

    Craft.create(craft)
  end
end