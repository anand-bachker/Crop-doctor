// import 'package:crop_disease_detection/controller/signup_controller.dart';
// import 'package:crop_disease_detection/model/user_model.dart';
// import 'package:crop_disease_detection/screens/Forget%20Password/otp_screen_phone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                // controller: controller.fullName,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline_outlined),
                    labelText: 'full_name'.tr,
                    hintText: 'full_name'.tr,
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // controller: controller.email,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: 'email'.tr,
                    hintText: 'email'.tr,
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // controller: controller.phoneNo,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.numbers_outlined),
                    labelText: 'phone'.tr,
                    hintText: 'phone'.tr,
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // controller: controller.password,
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
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   // SignUpController.instance.registerUser(
                    //   //     controller.email.text.trim(),
                    //   //     controller.password.text.trim());
                    //   // SignUpController.instance
                    //   //     .phoneAuthentication(controller.phoneNo.text.trim());
                    //   // Get.to(() => const OTPScreenPhone());
                    //   final user = UserModel(
                    //       email: controller.email.text.trim(),
                    //       password: controller.password.text.trim(),
                    //       fullName: controller.fullName.text.trim(),
                    //       phoneNo: controller.phoneNo.text.trim());
                    //   SignUpController.instance
                    //       .createUser(user);
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 16, 160, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text(
                    'signup'.tr.toUpperCase(),
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
