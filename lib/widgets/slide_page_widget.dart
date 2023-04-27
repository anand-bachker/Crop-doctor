import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/slide_model/slide_model.dart';

class SlidePageWidget extends StatelessWidget {
  const SlidePageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SlideModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: model.height * 0.5,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: GoogleFonts.raleway(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10,),
              Text(
                model.description,
                style: GoogleFonts.raleway(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40,)
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}