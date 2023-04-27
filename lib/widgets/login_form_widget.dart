import 'package:crop_disease_detection/widgets/forget_password_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/Forget Password/forget_password_mail.dart';
import '../screens/Forget Password/forget_password_phone.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline_outlined),
                labelText: 'email'.tr,
                hintText: 'email'.tr,
                border: const OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: 'pass'.tr,
                hintText: 'pass'.tr,
                border: const OutlineInputBorder(),
                suffixIcon: const IconButton(
                  icon: Icon(Icons.remove_red_eye_sharp),
                  onPressed: null,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    builder: (context) => Container(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10,),
                              Text('make_selection'.tr,
                                  style: GoogleFonts.raleway(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'option_selection'.tr,
                                style: GoogleFonts.raleway(fontSize: 15),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ForgetPasswordBtnWidget(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ForgetPassowordMailScreen()));
                                },
                                title: 'email'.tr,
                                subTitle: 'reset_email'.tr,
                                btnIcon: Icons.mail_outline_rounded,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ForgetPasswordBtnWidget(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const ForgetPassowordPhoneScreen()));
                                },
                                title: 'phone'.tr,
                                subTitle: 'reset_phone'.tr,
                                btnIcon: Icons.mobile_friendly_rounded,
                              ),
                            ],
                          ),
                        ));
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 16, 160, 0))),
              child: Text('forget_password'.tr, style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 16, 160, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: Text(
                'login'.tr.toUpperCase(),
                style: GoogleFonts.raleway(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ));
  }
}


