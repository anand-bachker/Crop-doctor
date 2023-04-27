// Import statements for various dependencies
import 'package:crop_disease_detection/controller/language_controller.dart';
import 'package:crop_disease_detection/screens/splash_screen.dart';
import 'package:crop_disease_detection/utils/app_constants.dart';
import 'package:crop_disease_detection/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/dep.dart' as dep;

// Declare a global variable
int? isViewed;

// Asynchronous main function
void main() async {
  // Ensures that Flutter has initialized all necessary bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Calls the `init()` function from a file named `dep.dart`
  // This function initializes some dependencies used in the app
  Map<String, Map<String, String>> _languages = await dep.init();

  // Runs the app with the initialized dependencies
  runApp(MyApp(
    languages: _languages,
  ));
}

// A stateless widget that builds the app
class MyApp extends StatelessWidget {
  MyApp({required this.languages});
  final Map<String, Map<String, String>> languages;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GetMaterialApp(
        // The title of the app
        title: 'Flutter Demo',
        // Disables the debug banner
        debugShowCheckedModeBanner: false,
        // The app's theme
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // The app's locale
        locale: localizationController.locale,
        // The app's translations
        translations: Messages(languages: languages),
        // The fallback locale if no matching locale is found
        fallbackLocale: Locale(AppConstants.languages[0].languageCode,
            AppConstants.languages[0].countryCode),
        // The initial screen of the app
        home: const SplashScreen(),
      );
    });
  }
}
