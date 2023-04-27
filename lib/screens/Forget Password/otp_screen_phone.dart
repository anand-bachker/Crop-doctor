// import 'package:crop_disease_detection/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreenPhone extends StatelessWidget {
  const OTPScreenPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otp;
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Text(
                  'code'.tr,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 80),
                ),
                Text('verification'.tr.toUpperCase(),
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'otp_desc_phone'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  keyboardType: TextInputType.number,
                  onSubmit: (code) {
                    otp = code;
                    // OTPController.instance.verifyOTP(otp);
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // OTPController.instance.verifyOTP(otp);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 16, 160, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text(
                      'next'.tr.toUpperCase(),
                      style: GoogleFonts.raleway(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
