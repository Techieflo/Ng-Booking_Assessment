import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class OTPTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool autoFocus;
  final ValueChanged<String> onChanged;

  OTPTextField({
    required this.controller,
    required this.focusNode,
    required this.autoFocus,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: autoFocus,
          maxLength: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',

          
          ),
          style: const TextStyle(fontSize: 20.0),
          onChanged: onChanged,
        ));
  }
}
