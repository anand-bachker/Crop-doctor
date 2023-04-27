import 'package:crop_disease_detection/controller/language_controller.dart';
import 'package:crop_disease_detection/screens/slide_screen.dart';
import 'package:crop_disease_detection/screens/welcome_screen.dart';
import 'package:crop_disease_detection/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/language_widget.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({Key? key}) : super(key: key);

  @override
  State<LangScreen> createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  // Checks if the app has been seen before using shared preferences
  Future<void> _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      // If the app has been seen before, navigate to the welcome screen
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    } else {
      // If the app has not been seen before, set the seen flag to true and navigate to the slide screen
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SlideScreenPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Main widget that displays a column of widgets
    return Container(
      color: const Color.fromARGB(255, 138, 255, 142),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: GetBuilder<LocalizationController>(
              builder: (localizationController) {
            // Uses GetX to manage state and render widgets based on the selected language
            return Column(
              children: [
                // Header with gradient color
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 185, 250, 187),
                    Colors.white
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10),
                          Text("Hello!",
                              textScaleFactor: 3,
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            Text(
                              "Please select your language",
                              textScaleFactor: 1.5,
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                // Body with grid view of language options
                Container(
                  color: Colors.white,
                  height: 650,
                  width: 420,
                  padding: const EdgeInsets.only(left: 120, right: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3,
                          mainAxisSpacing: 100,
                        ),
                        itemCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => LanguageWidget(
                          languageModel:
                              localizationController.languages[index],
                          localizationController: localizationController,
                          index: index,
                          onpress: () {
                            localizationController.setLanguage(Locale(
                                AppConstants.languages[index].languageCode,
                                AppConstants.languages[index].countryCode));
                            localizationController.setSelectedIndex(index);
                            setState(() {
                              _checkFirstSeen();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
