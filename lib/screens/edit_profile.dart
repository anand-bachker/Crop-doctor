// This is a Flutter code for an Edit Profile Screen UI.

// Importing required packages
import 'package:flutter/material.dart'; // For UI components
import 'package:get/get.dart'; // For localization support
import 'package:google_fonts/google_fonts.dart'; // For custom fonts

// EditProfileScreen class is a stateless widget
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  // The build method is where the UI is constructed
  @override
  Widget build(BuildContext context) {
    // Creates a container with a white background color
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text(
              'edit_profile'
                  .tr, // 'tr' stands for translation, it will translate this string to the user's locale
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(30),

                // Column widget to arrange UI components vertically
                child: Column(
                  children: [
                    // Stack widget to overlap profile image and camera icon
                    Stack(
                      children: [
                        // A circular profile image with gray background color
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                                color: const Color.fromARGB(255, 231, 231, 231),
                                child:
                                    Image.asset("assets/images/profile.png")),
                          ),
                        ),
                        // A green camera icon at the bottom right of the profile image
                        Positioned(
                          bottom: 0,
                          right: 5,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color.fromARGB(255, 16, 160, 0)),
                              child: const Icon(
                                Icons.photo_camera_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    // Form widget to get user input
                    Form(
                      child: Column(
                        children: [
                          // Text input field for full name
                          TextFormField(
                            // initialValue: userData.fullName, // Initial value is commented out
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.person_outline_outlined),
                              labelText: 'full_name'.tr,
                              hintText: 'full_name'.tr,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Text input field for email
                          TextFormField(
                            // initialValue: userData.email, // Initial value is commented out
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email_outlined),
                                labelText: 'email'.tr,
                                hintText: 'email'.tr,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Text input field for phone number
                          TextFormField(
                            // initialValue: userData.phoneNo, // Initial value is commented out
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.call),
                              labelText: 'full_name'.tr,
                              hintText: 'full_name'.tr,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // initialValue: userData.email,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email_outlined),
                                labelText: 'email'.tr,
                                hintText: 'email'.tr,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // initialValue: userData.phoneNo,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.call),
                                labelText: 'phone'.tr,
                                hintText: 'phone'.tr,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // initialValue: userData.password,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.fingerprint),
                                labelText: 'pass'.tr,
                                hintText: 'pass'.tr,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                suffixIcon: const IconButton(
                                  icon: Icon(Icons.remove_red_eye_sharp),
                                  onPressed: null,
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 16, 160, 0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        child: Text(
                          'edit_profile'.tr,
                          style: GoogleFonts.raleway(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
