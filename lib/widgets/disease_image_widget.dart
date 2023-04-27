import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DiseaseImageWidget extends StatelessWidget {
  final String image;
  const DiseaseImageWidget({
    Key? key, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            image,
            height: 190,
            width: 190,
          ),
        ),
        const SizedBox(height: 5,),
        Text(
          'disease_image'.tr,
          style: GoogleFonts.raleway(
              fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}