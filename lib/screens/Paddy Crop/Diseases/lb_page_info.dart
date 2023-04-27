import 'package:crop_disease_detection/screens/Paddy%20Crop/Management/lb_management.dart';
import 'package:crop_disease_detection/screens/Paddy%20Crop/Symptoms/lb_symptoms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LBPage extends StatelessWidget {
  const LBPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 208, 255, 211),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text(
              'lb'.tr,
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 211, 255, 212), Colors.white],
                begin: Alignment.topCenter, end: Alignment.center
              )
            ),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/lb_main.jpg",
                    height: 400,
                  ),
                ),
                const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                              builder: (context) => const LBSymptoms()));
                      },
                      child: Container(
                        height: 200,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(),
                          gradient: const LinearGradient(
                            colors: [
                            Color.fromARGB(255, 185, 250, 187),
                            Colors.white
                            ], 
                            begin: Alignment.topCenter, 
                            end: Alignment.bottomCenter
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/Symptoms.png"),
                            Text('symptoms'.tr, style: GoogleFonts.raleway(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 40,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                              builder: (context) => const LBManagement()));
                      },
                      child: Container(
                        height: 200,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(),
                          gradient: const LinearGradient(
                            colors: [
                            Color.fromARGB(255, 185, 250, 187),
                            Colors.white
                            ], 
                            begin: Alignment.topCenter, 
                            end: Alignment.bottomCenter
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/Management.png"),
                            Text('management'.tr, style: GoogleFonts.raleway(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
