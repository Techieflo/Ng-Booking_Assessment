import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LogosRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: HexColor("#E5E7EB")),
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Image.asset(
              'assets/images/facebook.png',
              width: 70,
              height: 70,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: HexColor("#E5E7EB")),
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Image.network(
              'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
              width: 70,
              height: 70,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: HexColor("#E5E7EB")),
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Image.network(
              'https://cdn-icons-png.freepik.com/256/12107/12107562.png?ga=GA1.1.40792780.1738662079&semt=ais_hybrid',
              width: 80,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
