import 'package:assessment/apis/apicalls.dart';
import 'package:assessment/views/verify_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var email = ''.obs;
  var error_value = ''.obs;
  var password = ''.obs;
  var token = ''.obs;
  var responseMessage = ''.obs;
  var selectedCountryCode = "+234".obs;
  var phoneNumber = "".obs;
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  final ApiService _apiService = ApiService();
  @override
  void onInit() {
    super.onInit();
    debounce(email, (value) {
      isEmailValid.value = validateEmail(value);
    }, time: const Duration(milliseconds: 500));

    debounce(password, (value) {
      isPasswordValid.value = validatePassword(value);
    }, time: Duration(milliseconds: 500));
  }

  bool validateEmail(String value) {
    // Simple email validation
    return value.isNotEmpty && GetUtils.isEmail(value);
  }

  bool validatePassword(String value) {
    // Password validation: At least 6 characters
    if (password.value.length < 6) {
      error_value.value = "Password cannot be less than 6";
    } else if (!password.value.contains(RegExp(r'[A-Z]'))) {
      error_value.value = "Password must contain an UpperCase";
    } else if (!password.value.contains(RegExp(r'\d'))) {
      error_value.value = "Password must contain at least a number";
    }

    return value.isNotEmpty &&
        value.length >= 6 &&
        value.contains(RegExp(r'[A-Z]')) &&
        value.contains(RegExp(r'\d'));
  }

  void signUp() {
    // Check if both email and password are valid
    if (isEmailValid.value && isPasswordValid.value) {
      sendVerificationEmail();

      print('Email: ${email.value}, Password: ${password.value}');
    } else {
      // Show error message if fields are not valid
      Get.snackbar('Error', 'Please enter valid email and password');
    }
  }

  void sendVerificationEmail() async {
    try {
      final response = await _apiService.sendEmailVerification(email.value);
      responseMessage.value = response.data!.token.toString();
      token = responseMessage;
      // Check if the token is not null and not empty
      if (token.isNotEmpty) {
        showTokenDialog(token.value);
      } else {
        // Show snackbar with response message if token is null or empty
        Get.snackbar('Email Verification', responseMessage.value);
      }
    } catch (e) {
      // Show error snackbar if request fails
      Get.snackbar('Error', e.toString());
    }
  }

  void showTokenDialog(String token) {
    Get.dialog(
      CupertinoAlertDialog(
        title: const Text('Email Verification'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Verification code sent successfully!'),
            const SizedBox(height: 10),
            Text(
              'Token: Your verification code is  $token \n Enter it on the next screen',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => VerifyEmail()); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
