class WeatherResponse {
  final Coordinates? coordinates;
  final Weather? weather;
  final Main? main;
  final Wind? wind;
  final String? name;
  final System? sys;

  WeatherResponse({
    this.coordinates,
    this.weather,
    this.main,
    this.wind,
    this.name,
    this.sys,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      coordinates: Coordinates.fromJson(json['coord']),
      weather: Weather.fromJson(json['weather'][0]),
      main: Main.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      name: json['name'],
      sys: System.fromJson(json['sys']),
    );
  }
}

class Coordinates {
  final num? lat, lon;

  Coordinates({
    this.lat,
    this.lon,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}

class Weather {
  final num? id;
  final String main, description, icon;

  Weather({
    this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Main {
  num? temp, tempMin, tempMax, feelsLike, pressure, humidity;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.feelsLike,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class Wind {
  num? speed, deg;
  num? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
      gust: json['gust'],
    );
  }
}

class System {
  final String country;
  final num? sunrise, sunset;
  final num? type, id;

  System({
    this.type,
    this.id,
    required this.country,
    this.sunrise,
    this.sunset,
  });

  factory System.fromJson(Map<String, dynamic> json) {
    return System(
      type: json['type'],
      id: json['id'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      country: json['country'],
    );
  }
}
