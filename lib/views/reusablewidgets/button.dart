import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget button(Function function, text) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 50),
    height: 50,
    decoration: BoxDecoration(
      color: HexColor("#111827").withOpacity(.7),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: GestureDetector(
      onTap: () {
        function;
      },
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Color.fromARGB(255, 190, 178, 178),
            fontSize: 20,
            fontFamily: "SFPro"),
      )),
    ),
  );
}
