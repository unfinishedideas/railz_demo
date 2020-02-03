class Weather
  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

def get_weather
  response = HTTParty.get('api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}
&appid=[YOUR API KEY HERE]')
    response["description"]["temperature"]
end

end
