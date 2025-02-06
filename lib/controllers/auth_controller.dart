import 'package:assessment/views/homescreen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:assessment/apis/Api.dart';
import 'package:assessment/models/auth_modal.dart';
import 'package:assessment/views/dashboard.dart';
import 'package:assessment/views/password_reset_email.dart';
import 'package:assessment/views/reusablewidgets/proccesing_dialog.dart';
import 'package:assessment/views/signin_page.dart';

class AuthController extends GetxController {
  final ApiServices apiService = ApiServices();

  // Rx variables for text fields
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var phoneNumber = ''.obs;
  var selectedCountryCode = ''.obs;
  var otp = ''.obs;
  RxBool isChecked = false.obs; // Remember Me checkbox state

  // Observables for loading state and error messages
  var errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Check login status on startup
  }

  // Check if the user is already logged in
  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('loggedIn') ?? false;
    String username = prefs.getString('username') ?? '';

    return loggedIn && username.isNotEmpty;
  }

  // Signup function
  Future<void> signup() async {
    if (!validateInputs(true)) {
      Get.snackbar("Error", errorMessage.value,
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    ProcessingDialog.show();
    UserRequest userRequest = UserRequest(
      fullName: '${firstName.value} ${lastName.value}',
      email: email.value.trim(),
      phoneNumber: phoneNumber.value,
      password: password.value.trim(),
    );

    UserResponse? response = await apiService.createUser(userRequest);
    ProcessingDialog.hide();

    if (response != null) {
      Get.snackbar("Success", "Account created successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
      Get.off(() => Signin());
    } else {
      Get.snackbar("Error", "Registration failed",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  // Login function with Remember Me
  Future<void> login() async {
    if (!validateInputs(false)) {
      Get.snackbar("Error", errorMessage.value,
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    ProcessingDialog.show();
    LoginRequest loginRequest = LoginRequest(
      email: email.value.trim(),
      password: password.value.trim(),
    );

    LoginResponse? response = await apiService.loginUser(loginRequest);
    ProcessingDialog.hide();

    if (response != null) {
      String username = response.userInfo.fullName; // Get username

      Get.snackbar("Success", "Welcome $username!",
          backgroundColor: Colors.green, colorText: Colors.white);

      // Save login state & username if "Remember Me" is checked
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (isChecked.value) {
        await prefs.setBool('loggedIn', true);
        await prefs.setString('username', username);
      }

      Get.off(() => Dashboard(token: username)); // Pass username as token
    } else {
      Get.snackbar("Error", "Login failed",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  // Logout function
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false); // Clear login state
    await prefs.remove('username'); // Remove stored username
    Get.offAll(() => Signin()); // Redirect to login screen
  }

  // Validate Inputs
  bool validateInputs(bool isSignup) {
    if (isSignup &&
        (firstName.value.trim().isEmpty || lastName.value.trim().isEmpty)) {
      errorMessage.value = "First Name and Last Name are required";
      return false;
    }

    if (!GetUtils.isEmail(email.value.trim())) {
      errorMessage.value = "Enter a valid email address";
      return false;
    }

    if (password.value.length < 8) {
      errorMessage.value = "Password must be at least 8 characters";
      return false;
    }

    if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(password.value)) {
      errorMessage.value =
          "Password must contain at least one letter, one number, and one special character.";
      return false;
    }

    if (isSignup && password.value != confirmPassword.value) {
      errorMessage.value = "Passwords do not match";
      return false;
    }

    errorMessage.value = "";
    return true;
  }

  // Forgot Password function
  Future<void> forgotPassword() async {
    if (!GetUtils.isEmail(email.value.trim())) {
      Get.snackbar("Error", "Enter a valid email address",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    String? response = await apiService.forgotPassword(email.value.trim());

    if (response != null) {
      Get.snackbar("Success", response,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      Get.to(() => ResetEmail());
    }
  }

  // Reset Password function
  Future<void> resetPassword(String otp) async {
    if (password.value.isEmpty || confirmPassword.value.isEmpty) {
      Get.snackbar("Error", "Password and Confirm Password are required",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    if (password.value.length < 8) {
      Get.snackbar("Error", "Password must be at least 8 characters",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(password.value)) {
      Get.snackbar("Error",
          "Password must contain at least one letter, one number, and one special character.",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    if (password.value != confirmPassword.value) {
      Get.snackbar("Error", "Passwords do not match",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    if (otp.isEmpty) {
      Get.snackbar("Error", "OTP is required",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    ProcessingDialog.show();
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    var response = {
      "success": true,
      "message": "Password changed successfully",
    };

    ProcessingDialog.hide();

    if (response["success"] == true) {
      Get.snackbar("Success", "Password changed successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
      Get.off(() => Signin());
    } else {
      Get.snackbar("Error", "Invalid OTP or reset failed",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
