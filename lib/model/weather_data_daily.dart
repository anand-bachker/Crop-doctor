// This class represents a collection of daily weather data
class WeatherDataDaily {
  List<Daily> daily; // A list of Daily objects for each day
  WeatherDataDaily(
      {required this.daily}); // Constructor that initializes the daily list

  // Factory method to create a WeatherDataDaily object from a JSON map
  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) =>
      WeatherDataDaily(
          daily: List<Daily>.from(json['daily'].map((e) => Daily.fromJson(e))));
}

// This class represents the weather data for a single day
class Daily {
  int? dt; // Date and time (in Unix timestamp format)
  Temp? temp; // Temperature data for the day
  List<Weather>?
      weather; // List of Weather objects for different weather conditions in the day

  Daily({
    this.dt,
    this.temp,
    this.weather,
  });

  // Factory method to create a Daily object from a JSON map
  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json['dt'] as int?,
        temp: json['temp'] == null
            ? null
            : Temp.fromJson(json['temp'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  // Method to convert a Daily object to a JSON map
  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

// This class represents the temperature data for a day
class Temp {
  double? day; // Daytime temperature
  int? min; // Minimum temperature for the day
  int? max; // Maximum temperature for the day
  double? night; // Nighttime temperature
  double? eve; // Temperature in the evening
  double? morn; // Temperature in the morning

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  // Factory method to create a Temp object from a JSON map
  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: (json['day'] as num?)?.toDouble(),
        min: (json['min'] as num?)?.round(),
        max: (json['max'] as num?)?.round(),
        night: (json['night'] as num?)?.toDouble(),
        eve: (json['eve'] as num?)?.toDouble(),
        morn: (json['morn'] as num?)?.toDouble(),
      );

  // Method to convert a Temp object to a JSON map
  Map<String, dynamic> toJson() => {
        'day': day,
        'min': min,
        'max': max,
        'night': night,
        'eve': eve,
        'morn': morn,
      };
}

// This class represents a single weather condition (e.g. sunny, cloudy, etc.)
class Weather {
  int? id; // Unique ID for the weather condition
  String? main; // Short description of the weather condition
  String? description; // Detailed description of the weather condition
  String? icon; // Icon representing the weather condition

  Weather({this.id, this.main, this.description, this.icon});

  // Factory method to create a Weather object from a JSON map
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
