import 'package:assessment/apis/apicalls.dart';
import 'package:assessment/apis/deviceinfo.dart';
import 'package:assessment/controllers/dashboard_controller.dart';
import 'package:assessment/models/login.dart';
import 'package:assessment/views/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var loginResponse = Rxn<LoginResponse>();
  final email = ''.obs;
  final password = ''.obs;
  final device_name = ''.obs;
  RxBool emailValid = false.obs;
  var token = ''.obs;
  RxBool passwordValid = false.obs;
  var errorMessage = ''.obs;
  bool get allFieldsValid => emailValid.value;

  @override
  void onInit() {
    super.onInit();
    setDeviceName();
    ever(email, (_) => validateEmail());
    // ever(password, (_) => validatePassword());
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void validateEmail() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    emailValid.value = emailRegex.hasMatch(email.value);
  }

  // void validatePassword() {
  //   passwordValid.value = password.value.length >= 6;
  // }

  void submit() {
    if (allFieldsValid) {
      print('Email: ${email.value}');
      print('Password: ${password.value}');
      login();
    }
  }

  Future<void> setDeviceName() async {
    final deviceName = await DeviceInfoUtil.getDeviceName();
    device_name.value = deviceName;
  }

  void login() async {
    final request = LoginRequest(
      email: email.value,
      password: password.value,
      deviceName: device_name.value,
    );

    try {
      final response = await ApiService().login(request);
      loginResponse.value = response;
      errorMessage.value = '';
      _showResponseDialog(response);
      print(response.data!.token);
    } catch (e) {
      errorMessage.value = e.toString();
      loginResponse.value = null;
      _showErrorDialog(errorMessage.value);
    }
  }

  void _showErrorDialog(String error) {
    Get.dialog(
      CupertinoAlertDialog(
        title: const Text(
          'Error',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(error + "\n You do not have an account yet"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showResponseDialog(LoginResponse response) {
    Get.dialog(
      CupertinoAlertDialog(
        title: const Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          fill: 1.0,
          size: 60,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Login ${response.message}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              token.value = response.data!.token!;
              Get.off(
                Dashboard(token: token.value),
                transition: Transition.cupertino, // Use a custom transition
                duration: const Duration(
                    milliseconds: 500), // Duration of the transition
                curve: Curves.easeInOut,
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
