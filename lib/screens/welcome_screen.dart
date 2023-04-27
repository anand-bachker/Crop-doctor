import 'package:crop_disease_detection/screens/HomePages/home_screen.dart';
import 'package:crop_disease_detection/screens/login_screen.dart';
import 'package:crop_disease_detection/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A container with a green background color is created
    return Container(
      color: const Color.fromARGB(255, 138, 255, 142),
      child: SafeArea(
        // A Scaffold widget is used to provide basic material design structure
        child: Scaffold(
          body: Container(
            // A gradient background is created with two colors
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 185, 250, 187), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.center)),
            // A Stack widget is used to layer widgets on top of each other
            child: Stack(
              alignment: Alignment.center,
              children: [
                // An image of a plant is displayed at the center
                Center(
                  child: Image.asset("assets/images/welcome_image.png"),
                ),
                // Two buttons are displayed below the plant image
                Positioned(
                  bottom: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // A green-outlined login button is created
                      OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          style: OutlinedButton.styleFrom(
                              primary: const Color.fromARGB(255, 16, 160, 0),
                              fixedSize: const Size(120, 50),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 16, 160, 0),
                                  width: 2)),
                          child: Text('login'.tr,
                              style: GoogleFonts.raleway(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      const SizedBox(width: 30),
                      // A green-filled signup button is created
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 16, 160, 0),
                              fixedSize: const Size(120, 50)),
                          child: Text('signup'.tr,
                              style: GoogleFonts.raleway(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                // A 'skip' text button is displayed at the top right of the screen
                Positioned(
                    top: 20,
                    right: 20,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Text('skip'.tr,
                          style: GoogleFonts.raleway(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
