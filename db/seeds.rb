# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Place.create!([
  { "name": "P-Town", "lat": "45.5051", "lon": "-122.6750"},
  { "name": "Buckingham Palace", "lat": "51.501564","lon": "-0.141944"},
  { "name": "Westminster Abbey", "lat": "51.499581", "lon": "-0.127309"},
  { "name": "Big Ben", "lat": "51.500792", "lon": "-0.124613"}
  ])
