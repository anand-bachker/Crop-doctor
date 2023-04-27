// Import necessary libraries
import 'dart:convert';
import 'package:crop_disease_detection/api/api_key.dart';
import 'package:crop_disease_detection/model/weather_data.dart';
import 'package:crop_disease_detection/model/weather_data_current.dart';
import 'package:crop_disease_detection/model/weather_data_daily.dart';
import 'package:crop_disease_detection/model/weather_data_hourly.dart';
import 'package:http/http.dart' as http;

// Define a class for fetching weather data
class FetchWeatherAPI {
  // Declare a nullable WeatherData property
  WeatherData? weatherData;

  // Define a method for processing weather data
  Future<WeatherData> processData(lat, lon) async {
    // Make an HTTP request to the OpenWeatherMap API
    var response = await http.get(Uri.parse(apiURL(lat, lon)));

    // Decode the JSON response into a Map
    var jsonString = jsonDecode(response.body);

    // Create a WeatherData object using the decoded JSON data
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
      WeatherDataDaily.fromJson(jsonString),
    );

    // Return the WeatherData object
    return weatherData!;
  }
}

// Define a function for generating the OpenWeatherMap API URL
String apiURL(var lat, var lon) {
  String url;

  // Construct the URL string with the given latitude, longitude, API key, and unit of measurement
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apikey&units=metric&exclude=minutely";

  // Return the URL string
  return url;
}
