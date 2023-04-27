import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LBManagement extends StatelessWidget {
  const LBManagement({Key? key}) : super(key: key);

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
              'management'.tr,
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'preventive'.tr,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text('lb_preventive1'.tr),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text('lb_preventive2'.tr),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                    'lb_preventive3'.tr
                  ),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                      'lb_preventive4'.tr),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                    'lb_preventive5'.tr,
                  ),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                    'lb_preventive6'.tr,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'cultural'.tr,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                      'lb_cultural1'.tr),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                      'lb_cultural2'.tr),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                    'lb_cultural3'.tr,
                  ),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text('lb_cultural4'.tr),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                    'lb_cultural5'.tr,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'chemical'.tr,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text('lb_chemical1'.tr),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text('lb_chemical2'.tr),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                    'lb_chemical3'.tr
                  ),
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                      'lb_chemical4'.tr)
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.fiber_manual_record),
                  title: Text(
                    'lb_chemical5'.tr
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )));
  }
}
