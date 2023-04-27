import 'package:flutter/material.dart';

class SlideModel {
  final String image;
  final String title;
  final String description;
  final Color bgColor;
  final double height;

  SlideModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.bgColor,
      required this.height});
}
