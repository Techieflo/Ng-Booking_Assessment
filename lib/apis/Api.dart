import 'dart:convert';
import 'package:assessment/models/auth_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiServices {
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';

  Future<UserResponse?> createUser(UserRequest userRequest) async {
    final url = Uri.parse('$baseUrl/signup');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userRequest.toJson()),
      );
      print(jsonEncode(userRequest.toJson()));
      if (response.statusCode == 200) {
        return UserResponse.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        throw Exception("User already exists");
      } else {
        throw Exception("Internal Server Error");
      }
    } catch (e) {
      Get.snackbar("An Error Occured", "$e");
      print("Error: $e");
      return null;
    }
  }

  Future<LoginResponse?> loginUser(LoginRequest loginRequest) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"}, // Include this header
        body: jsonEncode(loginRequest.toJson()),
      );

      print("Request body: ${jsonEncode(loginRequest.toJson())}");
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 201) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        Get.snackbar("Error", "Incorrect Credentials",
            backgroundColor: Colors.red, colorText: Colors.white);
        throw Exception("Incorrect credentials");
      } else if (response.statusCode == 404) {
        Get.snackbar("Error", "User does not exist",
            backgroundColor: Colors.red, colorText: Colors.white);
        throw Exception("User not found");
      } else {
        throw Exception("Internal Server Error");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "$e",
          backgroundColor: Colors.red, colorText: Colors.white);
      return null;
    }
  }

  //forgot passsword:
  Future<String?> forgotPassword(String email) async {
    final url = Uri.parse('$baseUrl/forgot-password');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      print(response.body);

      final responseData = jsonDecode(response.body); // ✅ Parse JSON

      if (response.statusCode == 200) {
        return responseData["message"].toString();
      } else if (response.statusCode == 400) {
        Get.snackbar(
            "Error", responseData["message"] ?? "Invalid email address",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        return null;
      } else if (responseData["message"]
          .toString()
          .contains("User not found")) {
        Get.snackbar(
            "Error", responseData["message"] ?? "Invalid email address",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        return null;
      } else {
        throw Exception(responseData["message"] ?? "Internal Server Error");
      }
    } catch (e) {
      Get.snackbar("Error", "$e",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return null;
    }
  }

  // Reset Password
  Future<Map<String, dynamic>?> resetPassword(
      String otp, String newPassword) async {
    final url = Uri.parse('$baseUrl/reset-password');

    try {
      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"otp": otp, "password": newPassword}),
      );

      print(response.body); // Debugging output

      if (response.statusCode == 200) {
        return jsonDecode(response
            .body); // { "message": "Success", "success": true, "token": "..." }
      } else if (response.statusCode == 404) {
        throw Exception("Invalid or expired OTP");
      } else {
        throw Exception("Internal Server Error");
      }
    } catch (e) {
      Get.snackbar("Error", "$e",
          backgroundColor: Colors.red, colorText: Colors.white);
      return null;
    }
  }
}
