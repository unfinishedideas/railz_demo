class Weather < ApplicationRecord
  def get_weather(lat, lon)
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{Rails.application.credentials.weather_api_key}")
  end
end
# class Weather
#   def initialize(lat, lon)
#     @lat = lat
#     @lon = lon
#   end
#
#   def get_weather
#     response = HTTParty.get('api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=weather_api_key')
#     response["description"]["temperature"]
#   end
# end
#
