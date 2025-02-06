import 'package:assessment/apis/apicalls.dart';
import 'package:assessment/controllers/signup_controllers.dart';
import 'package:assessment/views/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final SignUpController controller = Get.put(SignUpController());

class EmailVerificationController extends GetxController {
  var email = controller.email.value;
  var otp = List.filled(5, '').obs;
  var responseMessage = ''.obs;

  final ApiService apiService = ApiService();

  Future<void> verifyEmail() async {
    String token = otp.join();
    final result = await apiService.verifyEmail(email, token);
    responseMessage.value = result;
    if (result.contains('success')) {
      Get.to(() => Register());
    } else {
      Get.dialog(
        CupertinoAlertDialog(
          title: const Text('Icorrect Verification code'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Verification code entered is incorrect. \n Try again'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
