# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'pry'

Spot.destroy_all
Review.destroy_all
User.destroy_all

unique = 0
user_array = []
spots = []

admin = User.create!(
  :user_name => 'admin',
  :email => 'admin@admin.com',
  :password => '123',
  :admin => true)

  10.times do |index|
    user = User.create!(
    :user_name => "#{unique}_" + Faker::Superhero.name,
    :email => Faker::Lorem.characters(number: 10, min_alpha: 4) + "@user.com")
    unique += 1
    user_array.push(user)
  end

  p "Created #{User.count} users"

14.times do |index|
  spots = []
  spots.push(Spot.create!( name: Faker::Verb.unique.base.capitalize() + " Park",
    lat: 45.5+(rand(9999)/100000),
    lon: 122.6+(rand(9999)/100000),
    description: Faker::Space.distance_measurement + " from " +     Faker::Verb.unique.base.capitalize() + " Park",
    features: Faker::Construction.material + " " +   Faker::Appliance.equipment,
    spot_type: Faker::Movies::HitchhikersGuideToTheGalaxy.starship
      ))
  spots
  Review.create!(
    :title => Faker::Superhero.name,
    :content => Faker::Movies::Lebowski.quote,
    :user_id => user_array.sample.id,
    :rating => rand(1..5),
    :heat_lvl => rand(1..5),
    :spot_id => spots.sample.id
  )
end

  Spot.create! do ( name: "Episk8us",
    lat: 45.520818,
    lon: -122.677441,
    description: "8th floor, indoor skate spot",
    features: "Couches, waxed desks, Nate and team",
    spot_type: "indoor skatepark"
      )
      Review.create!(
        :title => "Its a School",
        :content => "I cam here all the way fomr Cali to skate here, but its just a School, WTF? this app sucks",
        :user_id => user_array.sample.id,
        :rating => rand(2),
        :heat_lvl => rand(1),
        :spot_id => spots.sample.id
      )
end

p "Created #{Spot.count} spots"
p "Created #{Review.count} reviews"

