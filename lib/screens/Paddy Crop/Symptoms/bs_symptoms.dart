import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BSSymptoms extends StatelessWidget {
  const BSSymptoms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 138, 255, 142),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text(
              'symptoms'.tr,
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const SizedBox(height: 30),
              ListTile(
                leading: const Icon(Icons.fiber_manual_record),
                title: Text('bs_symptoms1'.tr),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.fiber_manual_record),
                title: Text('bs_symptoms2'.tr),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.fiber_manual_record),
                title: Text('bs_symptoms3'.tr),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.fiber_manual_record),
                title: Text('bs_symptoms4'.tr),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.fiber_manual_record),
                title: Text('bs_symptoms5'.tr),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.fiber_manual_record),
                title: Text('bs_symptoms6'.tr),
              )
            ],
          ),
        )
      )
    );
  }
}