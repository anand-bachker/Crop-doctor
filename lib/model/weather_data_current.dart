// Define a class for the current weather data
class WeatherDataCurrent {
  final Current current; // Declare a final field for the current weather data

  // Define a constructor that requires a 'current' object
  WeatherDataCurrent({required this.current});

  // Define a factory method that creates a new instance of WeatherDataCurrent from JSON data
  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(
          current: Current.fromJson(json[
              'current'])); // Create a new instance of WeatherDataCurrent by calling the fromJson method of the Current class
}

// Define a class for the current weather conditions
class Current {
  // Declare fields to store various weather data attributes
  int? sunrise;
  int? sunset;
  int? temp;
  double? feelsLike;
  double? uvIndex;
  int? humidity;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;

  // Define a constructor that initializes the fields with optional named parameters
  Current({
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.uvIndex,
    this.humidity,
    this.clouds,
    this.windSpeed,
    this.weather,
  });

  // Define a factory method that creates a new instance of Current from JSON data
  factory Current.fromJson(Map<String, dynamic> json) => Current(
        sunrise: json['sunrise']
            as int?, // Parse the 'sunrise' field from the JSON data
        sunset: json['sunset']
            as int?, // Parse the 'sunset' field from the JSON data
        temp: (json['temp'] as num?)
            ?.round(), // Parse the 'temp' field from the JSON data and round it to the nearest integer
        feelsLike: (json['feels_like'] as num?)
            ?.toDouble(), // Parse the 'feels_like' field from the JSON data and convert it to a double
        uvIndex: (json['uvi'] as num?)
            ?.toDouble(), // Parse the 'uvi' field from the JSON data and convert it to a double
        humidity: json['humidity']
            as int?, // Parse the 'humidity' field from the JSON data
        clouds: json['clouds']
            as int?, // Parse the 'clouds' field from the JSON data
        windSpeed: (json['wind_speed'] as num?)
            ?.toDouble(), // Parse the 'wind_speed' field from the JSON data and convert it to a double
        weather: (json['weather'] as List<
                dynamic>?) // Parse the 'weather' field from the JSON data as a list of dynamic objects
            ?.map((e) => Weather.fromJson(e as Map<String,
                dynamic>)) // Call the fromJson method of the Weather class for each object in the list
            .toList(), // Convert the resulting iterable to a list and assign it to the 'weather' field
      );

  // Define a method that converts the object to JSON data
  Map<String, dynamic> toJson() => {
        'sunrise': sunrise,
        'sunset': sunset,
        'temp': temp,
        'feels_like': feelsLike,
        'uvi': uvIndex,
        'humidity': humidity,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

// Define a class for representing the weather conditions
class Weather {
  // Declare fields to store weather condition attributes
  int? id;
  String? main;
  String? description;
  String? icon;

  // Define

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
