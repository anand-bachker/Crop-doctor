import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import the Get package for localization
import 'package:google_fonts/google_fonts.dart'; // Import the Google Fonts package
import '../widgets/login_form_widget.dart'; // Import the login form widget

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Retrieve the screen size using MediaQuery
    return Container(
      color: Colors.white, // Set the background color of the screen to white
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(30), // Add padding to the container
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                "assets/images/logo.png", // Display the logo image
                height: size.height * 0.3, // Set the height of the image based on the screen size
              )),
              Center(
                child: Text(
                  'welcome_back'.tr, // Localized text using Get
                  style: GoogleFonts.raleway( 
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const LoginForm(), // Display the login form widget
              Column(
                children: [
                  Text('or'.tr.toUpperCase()), // Localized text using Get
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: Image.asset("assets/icons/google-logo.png", width: 20,), // Display the Google logo icon
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size(100, 50),
                          side: const BorderSide(color: Color.fromARGB(255, 16, 160, 0), width: 2)
                      ), 
                      onPressed: () {}, // Define the function to be called when the button is pressed
                      label: Text('signin_with_google'.tr, style: TextStyle(color: Colors.black),) // Localized text using Get
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dont_have_account'.tr, // Localized text using Get
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextButton(
                        onPressed: () {}, // Define the function to be called when the button is pressed
                        child: Text.rich(
                          TextSpan(
                            text: " " + 'signup'.tr.toUpperCase(), // Localized text using Get
                            style: GoogleFonts.raleway(
                              color: const Color.fromARGB(255, 16, 160, 0),
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            )
                          )
                        )
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )),
      )),
    );
  }
}
