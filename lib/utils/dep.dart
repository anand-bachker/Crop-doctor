import 'dart:convert';
import 'package:crop_disease_detection/controller/language_controller.dart';
import 'package:crop_disease_detection/model/language_model.dart';
import 'package:crop_disease_detection/utils/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This function initializes localization support for the application
Future<Map<String, Map<String, String>>> init() async {
  // Get an instance of SharedPreferences to store language preference
  final sharedPreference = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreference); // Register with GetX for later use
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  // Create a map of maps to hold the language translations
  Map<String, Map<String, String>> _languages = Map();

  // Iterate over available languages and load translations from JSON files
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();

    // Convert the dynamic values in the JSON file to string values
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });

    // Add the language translations to the map of maps
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }

  // Return the map of maps containing all the language translations
  return _languages;
}
