import 'package:flutter/material.dart';

class CustomImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Define the clipping path here
    return Path()
      ..addRect(Rect.fromLTRB(
        0,
        18, // 20 pixels from the top
        size.width,
        size.height - 200, // 40 pixels from the bottom
      ));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
