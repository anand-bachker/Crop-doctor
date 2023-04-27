import 'package:crop_disease_detection/controller/language_controller.dart';
import 'package:crop_disease_detection/model/language_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  final VoidCallback onpress;

  LanguageWidget({
    required this.languageModel, 
    required this.localizationController, 
    required this.index, 
    required this.onpress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), border: Border.all()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              languageModel.languageName.toUpperCase(),
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: languageModel.languageName == 'हिन्दी' ? 15 : null),
              textScaleFactor: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
