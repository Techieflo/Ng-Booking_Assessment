import 'package:flutter/material.dart';

Widget pinTextField(BuildContext context) {
  return Container(
    width: 40.0,
    height: 40.0,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
    ),
    child: TextField(
      decoration: const InputDecoration(
        counterText: '',
        border: InputBorder.none,
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      maxLength: 1,
      obscureText: true,
      obscuringCharacter: ".",
      style: const TextStyle(fontSize: 20.0),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}
