import 'package:crop_disease_detection/screens/Forget%20Password/otp_screen_mail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassowordMailScreen extends StatelessWidget {
  const ForgetPassowordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/forget_password.png",
                      height: size.height * 0.3,
                    )
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    'forget_password'.tr,
                    style: GoogleFonts.raleway( 
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'forget_password_email'.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway( 
                        fontSize: 16),
                  ),
                  const SizedBox(height: 60,),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('email'.tr, style: const TextStyle(color: Colors.black),),
                            hintText: 'email'.tr,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 16, 160, 0))
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 16, 160, 0))
                            ),
                            prefixIcon: const Icon(Icons.mail_outline_rounded, color: Colors.black,)
                          ),
                        ),
                        const SizedBox(height: 30,),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OTPScreenMail()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 16, 160, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            child: Text('next'.tr.toUpperCase(), style: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}