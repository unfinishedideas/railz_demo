class Weather {
  constructor(lat, lon) {
    this.lat = lat;
    this.lon = lon;
  }
}

async getWeatherByCity(lat, lon) {
    try {
      let response = await fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${Rails.application.credentials.weather_api_key}`);
      let jsonifiedResponse = await response.json();
      return jsonifiedResponse;
    } catch(error) {
      console.error("There was an error handling your request: " + error.message);
    }
  }
