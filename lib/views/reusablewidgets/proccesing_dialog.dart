import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ProcessingDialog {
  static bool _isDialogOpen = false;

  static void show() {
    if (_isDialogOpen) return; // Prevent multiple dialogs from stacking
    _isDialogOpen = true;

    Get.dialog(
      barrierDismissible: true,
      PopScope(
        canPop: true,
        child: Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: HexColor("#000080"),
                  strokeWidth: 5,
                ),
                SizedBox(height: 20),
                Text(
                  "Processing.....",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: HexColor("#000080"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).then((_) {
      _isDialogOpen = false; // Reset flag when dialog is dismissed
    });
  }

  static void hide() {
    if (_isDialogOpen) {
      _isDialogOpen = false;
      Future.delayed(Duration(milliseconds: 50), () {
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }
      });
    }
  }
}
