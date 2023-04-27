import 'package:crop_disease_detection/api/fetch_weather.dart'; // Importing an API file for fetching weather data
import 'package:crop_disease_detection/model/weather_data.dart'; // Importing a model class for weather data
import 'package:geolocator/geolocator.dart'; // Importing the geolocator package for getting the user's location
import 'package:get/get.dart'; // Importing the Get package for state management

class GlobalController extends GetxController { // Defining the GlobalController class that extends GetxController for state management
  final RxBool _isLoading = true.obs; // Defining a boolean variable to indicate if the data is loading
  final RxDouble _latitude = 0.0.obs; // Defining a double variable to store the user's latitude
  final RxDouble _longitude = 0.0.obs; // Defining a double variable to store the user's longitude
  final RxInt _currentIndex = 0.obs; // Defining an integer variable to store the current index

  RxBool checkLoading() => _isLoading; // Getter method to return the boolean value for loading
  RxDouble getLatitude() => _latitude; // Getter method to return the user's latitude
  RxDouble getLongitude() => _longitude; // Getter method to return the user's longitude

  final weatherData = WeatherData().obs; // Defining an observable variable to store weather data
  WeatherData getWeatherData() { // Getter method to return the weather data
    return weatherData.value;
  }

  @override
  void onInit() { // Overriding the onInit method to get the user's location and weather data when the app is initialized
    if (_isLoading.isTrue) { // Checking if data is still loading
      getLocation(); // Getting the user's location
    } else {
      getIndex(); // Getting the current index
    }
    super.onInit(); // Calling the parent onInit method
  }

  getLocation() async { // Method to get the user's location
    bool isServiceEnabled; // Defining a boolean variable to check if location services are enabled
    LocationPermission locationPermission; // Defining a variable to store the location permission status

    isServiceEnabled = await Geolocator.isLocationServiceEnabled(); // Checking if location services are enabled

    if (!isServiceEnabled) { // If location services are not enabled, return an error
      return Future.error("Location not enabled");
    }

    locationPermission = await Geolocator.checkPermission(); // Checking the location permission status

    if (locationPermission == LocationPermission.deniedForever) { // If the location permission is denied forever, return an error
      return Future.error("Location Permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) { // If the location permission is denied, request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) { // If the location permission is still denied, return an error
        return Future.error("Location Permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition( // If location services and permissions are enabled, get the user's location
            desiredAccuracy: LocationAccuracy.high) // Setting the desired accuracy for location data
        .then((value) { // Using a then clause to wait for the location data to be retrieved
      _latitude.value = value.latitude; // Storing the user's latitude
      _longitude.value = value.longitude; // Storing the user's longitude
      return FetchWeatherAPI() // Fetching the weather data using an

          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
