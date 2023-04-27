// This class represents the hourly weather data for a specific location.
class WeatherDataHourly {
  // A list of Hourly objects containing weather data for each hour.
  List<Hourly> hourly;

  // Constructor for creating a new WeatherDataHourly object.
  WeatherDataHourly({required this.hourly});

  // A factory method for creating a new WeatherDataHourly object from a JSON object.
  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      WeatherDataHourly(
          hourly:
              List<Hourly>.from(json['hourly'].map((e) => Hourly.fromJson(e))));
}

// This class represents the weather data for a single hour.
class Hourly {
  // The Unix timestamp for the hour represented by this object.
  int? dt;

  // The temperature in degrees Celsius.
  int? temp;

  // A list of Weather objects representing the current weather conditions.
  List<Weather>? weather;

  // Constructor for creating a new Hourly object.
  Hourly({
    this.dt,
    this.temp,
    this.weather,
  });

  // A factory method for creating a new Hourly object from a JSON object.
  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        dt: json['dt'] as int?,
        temp: (json['temp'] as num?)?.round(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  // Converts this object to a JSON object.
  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
