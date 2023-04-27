import 'package:crop_disease_detection/model/language_model.dart';

class AppConstants {
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  // language handler

  static List<LanguageModel> languages = [
    LanguageModel(
        languageName: 'English', languageCode: 'en', countryCode: 'US'),
    LanguageModel(
        languageName: 'हिन्दी', languageCode: 'hi', countryCode: 'IN'),
  ];
}
