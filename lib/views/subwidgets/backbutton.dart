import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class backbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: HexColor("#E5E7EB")),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(child: Icon(Icons.arrow_back_ios_rounded)));
  }
}
