// import 'package:crop_disease_detection/controller/authentication_repository.dart';
// import 'package:crop_disease_detection/controller/user_repository.dart';
// import 'package:crop_disease_detection/model/user_model.dart';
// import 'package:crop_disease_detection/screens/Forget%20Password/otp_screen_phone.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();

//   final email = TextEditingController();
//   final password = TextEditingController();
//   final fullName = TextEditingController();
//   final phoneNo = TextEditingController();

//   final userRepo = Get.put(UserRepository());

//   void registerUser(String email, String password) {
//     String? error = AuthenticationRepository.instance
//         .createUserWithEmailAndPassword(email, password) as String?;
//     if (error != null) {
//       Get.showSnackbar(GetSnackBar(message: error.toString()));
//     }
//   }

//   Future<void> createUser(UserModel user) async {
//     await userRepo.createUser(user);
//     phoneAuthentication(user.phoneNo);
//     Get.to(() => const OTPScreenPhone());
//   }

//   void phoneAuthentication(String phoneNo) {
//     AuthenticationRepository.instance.phoneAuthentication(phoneNo);
//   }
// }
